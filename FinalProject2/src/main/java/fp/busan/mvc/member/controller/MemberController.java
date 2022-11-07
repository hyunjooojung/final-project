package fp.busan.mvc.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;

import fp.busan.mvc.board.model.vo.Board;
import fp.busan.mvc.destination.model.vo.Destination;
import fp.busan.mvc.festival.model.vo.Festival;
import fp.busan.mvc.kind.model.vo.Kind;
import fp.busan.mvc.kind.service.KindService;
import fp.busan.mvc.member.model.vo.ACReservation;
import fp.busan.mvc.member.model.vo.BookMark;
import fp.busan.mvc.member.model.vo.GPReservation;
import fp.busan.mvc.member.model.vo.Member;
import fp.busan.mvc.member.model.vo.ResReser;
import fp.busan.mvc.member.model.vo.RoomReser;
import fp.busan.mvc.member.service.KakaoLogin;
import fp.busan.mvc.member.service.MemberService;
import fp.busan.mvc.member.service.NaverLoginBO;
import fp.busan.mvc.restaurant.model.vo.Restaurant;
import fp.busan.mvc.room.model.vo.Room;

@SessionAttributes("loginMember") // loginMember를 model에서 취급할때 Session으로 처리하는 파라메터
@RequestMapping("/mem")
@Controller
public class MemberController {

	@Autowired
	private MemberService service;

	@Autowired
	private KakaoLogin kakao;

	@Autowired
	private KindService kService;

	// 로그인
	@GetMapping("/moveLogin")
	public String moveLogin(Model model) {

		return "member/login";
	}

	@PostMapping("/login")
	public String login(Model model, @RequestParam Map<String, String> param, HttpServletResponse httpServletResponse) {

		System.out.println(param.toString());

		Member loginMember = service.login(param.get("userId"), param.get("userPwd"));

		if (loginMember != null) {
			if (loginMember.getUser_pw().equals(param.get("userPwd"))) {

				Cookie rememberCookie = new Cookie("CustomCheck", loginMember.getUser_id());

				rememberCookie.setDomain("localhost");
				rememberCookie.setPath("/fp");

				if (param.get("loginRemember") != null && param.get("loginRemember").length() > 0) {
					System.out.println(rememberCookie.getValue());
					rememberCookie.setMaxAge(60 * 60 * 24 * 7);
				} else {
					rememberCookie.setMaxAge(0);
				}
				httpServletResponse.addCookie(rememberCookie);

				model.addAttribute("loginMember", loginMember);
				model.addAttribute("msg", "로그인에 성공하였습니다.");
				model.addAttribute("location", "/");
				return "common/msg";

			} else {
				model.addAttribute("msg", "패스워드가 잘못되었습니다.");
				model.addAttribute("location", "/");
				return "common/msg";
			}

		} else {
			model.addAttribute("msg", "아이디가 존재하지 않습니다.");
			model.addAttribute("location", "/");
			return "common/msg";
		}
	}

	@RequestMapping("/kakao")
	public String kakao(@RequestParam(value = "code", required = false) String code, Model model) {
		System.out.println("#############" + code);

		String access_Token = kakao.getAccessToken(code);
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);

		System.out.println("###nickname#### : " + userInfo.get("nickname"));
		System.out.println("###email#### : " + userInfo.get("email"));
		System.out.println("###access_Token#### : " + access_Token);

		Map<String, String> map = new HashMap<String, String>();
		map.put("user_Id", (String) userInfo.get("email"));
		map.put("user_Status", "K");

		Member loginMember = service.findByIdKaNav(map);

		if (loginMember != null) {
			// kakao 아이디가 존재 할 때
			model.addAttribute("loginMember", loginMember);
			model.addAttribute("msg", "로그인에 성공하였습니다.");
			model.addAttribute("location", "/");

		} else {
			// 여기는 처음 가입할때
			loginMember = new Member();
			loginMember.setUser_id((String) userInfo.get("email"));
			loginMember.setUser_name((String) userInfo.get("nickname"));
			loginMember.setUser_email((String) userInfo.get("email"));
			loginMember.setUSER_STATUS("K");

			service.save(loginMember);

			model.addAttribute("loginMember", loginMember);
			model.addAttribute("msg", "회원가입에 성공하였습니다.");
			model.addAttribute("location", "/");
		}

		return "common/msg";
	}

	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	@RequestMapping("/naver")
	public String naver(HttpSession session, Model model) {

		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String location = naverLoginBO.getAuthorizationUrl(session);

		System.out.println("네이버:" + location);

		model.addAttribute("location", location);

		return "common/naverMsg";
	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping("/callback")
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {

		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;

		oauthToken = naverLoginBO.getAccessToken(session, code, state);

		// 1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken);

		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;

		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		// response의 nickname값 파싱
		String name = (String) response_obj.get("name");
		String mobile = (String) response_obj.get("mobile");
		String email = (String) response_obj.get("email");

		Map<String, String> map = new HashMap<String, String>();
		map.put("user_Id", email);
		map.put("user_Status", "V");

		Member loginMember = service.findByIdKaNav(map);

		if (loginMember != null) {
			// 아이디가 존재 할 때
			model.addAttribute("loginMember", loginMember);
			model.addAttribute("msg", "로그인에 성공하였습니다.");
			model.addAttribute("location", "/");

		} else {
			// 처음 가입할때
			loginMember = new Member();
			loginMember.setUser_id(email);
			loginMember.setUser_name(name);
			loginMember.setUser_email(email);
			loginMember.setUser_phone(mobile);
			loginMember.setUSER_STATUS("V");

			service.save(loginMember);

			model.addAttribute("loginMember", loginMember);
			model.addAttribute("msg", "회원가입에 성공하였습니다.");
			model.addAttribute("location", "/");
		}

		return "common/msg";
	}

	@RequestMapping("/logout")
	public String logout(SessionStatus status) {
		status.setComplete(); // 세션을 종료하는 코드
		return "redirect:/";
	}

	// 회원가입
	@GetMapping("/moveSignup")
	public String moveSignup(Model model) {

		return "member/signup";
	}

	@PostMapping("/signUp")
	public ModelAndView enroll(ModelAndView model, @ModelAttribute Member member) {
		System.out.println("member : " + member);
		int result = 0;
		try {
			result = service.save(member);
		} catch (Exception e) {
			e.printStackTrace();
			result = -1;
		}
		if (result > 0) {
			model.addObject("msg", "회원가입에 성공하였습니다.");
			model.addObject("location", "/");
		} else {
			model.addObject("msg", "회원가입에 실패하였습니다. 다시 한번 확인해주세요.");
			model.addObject("location", "/");
		}
		model.setViewName("common/msg");
		return model;
	}

	// 중복검사
	@GetMapping("/idCheck")
	public ResponseEntity<Map<String, Object>> idCheck(String user_id) {
		System.out.println("user_id : " + user_id);
		boolean result = service.validate(user_id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("validate", result);

		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}

	// 나의 정보
	@GetMapping("/myInfo")
	public String myInfo(Model model) {
		return "member/user-profile-info";
	}

	// 찜 목록
	@GetMapping("/myLike")
	public String mylike(Model model, @RequestParam int user_CODE) {

		int bmcCodeCount = service.selectBmcCodeCount(user_CODE);

		List<BookMark> bmcCode = service.BmcCode(user_CODE);

		for (int i = 0; i < bmcCodeCount; i++) {
			if (bmcCode.get(i).getBmc_Code() == 1) {
				List<Destination> desBookList = service.DesBookList(user_CODE);
				model.addAttribute("desBookList", desBookList);
			}
			if (bmcCode.get(i).getBmc_Code() == 2) {
				List<Room> roomBookList = service.RoomBookList(user_CODE);
				model.addAttribute("roomBookList", roomBookList);
			}
			if (bmcCode.get(i).getBmc_Code() == 3) {
				List<Restaurant> resBookList = service.ResBookList(user_CODE);
				model.addAttribute("resBookList", resBookList);
			}
			if (bmcCode.get(i).getBmc_Code() == 4) {
				List<Festival> fesBookList = service.FesBookList(user_CODE);
				model.addAttribute("fesBookList", fesBookList);
			}
			if (bmcCode.get(i).getBmc_Code() == 5) {
				List<Kind> kindBookList = service.KindBookList(user_CODE);
				model.addAttribute("kindBookList", kindBookList);
			}
		}

		return "member/user-profile-likelist";
	}

	// 리뷰 목록
	@GetMapping("/myReview")
	public String myReview(Model model, @RequestParam int user_CODE) {
		System.out.println(user_CODE);
		List<Board> boardList = service.selectBoardList(user_CODE);
		List<Member> memberList = service.selectMemberList(user_CODE);
		System.out.println("boardList : " + boardList);
		model.addAttribute("boardList", boardList);

		return "member/user-profile-reviewlist";
	}

	// 예약 목록
	
	@GetMapping("/myReservation")
	public String myReservation(Model model, @RequestParam int user_CODE) {
		int grpReserCount = service.selectResReservationCount(user_CODE);
		int acrReserCount = service.selectRoomReservationCount(user_CODE);

		List<GPReservation> grpReser = service.selectResReservationList(user_CODE);
		List<ACReservation> acrReser = service.selectRoomReservationList(user_CODE);
		List<RoomReser> roomReserDetail = service.selectRoomReservationDetail(user_CODE);
		List<ResReser> resReserDetail = service.selectResReservationDetail(user_CODE);

		System.out.println("resReserDetail : " + resReserDetail);
		System.out.println("roomReserDetail : " + roomReserDetail);
		
		model.addAttribute("resReserDetail", resReserDetail);
		model.addAttribute("roomReserDetail", roomReserDetail);
		model.addAttribute("acrReser", acrReser);
		model.addAttribute("grpReserCount", grpReserCount);
		model.addAttribute("acrReserCount", acrReserCount);
		model.addAttribute("grpReser", grpReser);

		return "member/user-profile-reservationlist";
	}

	// 정보 수정
	@GetMapping("/update")
	public String view() {
//		log.info("회원 정보 페이지 요청");
		return "member/user-profile-info";
	}

//	@SessionAttribute : 세션으로 가지고 있는 값을 command 객체로 땡겨올때 쓰는 어노테이션
	@PostMapping("/update")
	public String update(Model model, @ModelAttribute Member member, // @ModelAttribute 생략 가능!!
			@SessionAttribute(name = "loginMember", required = false) Member loginMember) {

		System.out.println(member.toString());
		System.out.println("login : " + loginMember.toString());

		/*
		 * 로그인 확인은 jsp에서 수정 if(loginMember == null ) { model.addAttribute("msg",
		 * "잘못된 접근입니다."); model.addAttribute("location", "/"); return "common/msg"; }
		 */

		if (member.getUser_name() != null && member.getUser_name().length() > 0) {
			loginMember.setUser_name(member.getUser_name());
		}
		if (member.getUser_id() != null && member.getUser_id().length() > 0) {
			loginMember.setUser_id(member.getUser_id());
		}
		if (member.getUser_phone() != null && member.getUser_phone().length() > 0) {
			loginMember.setUser_phone(member.getUser_phone());
		}
		if (member.getUser_pw() != null && member.getUser_pw().length() > 0) {
			loginMember.setUser_pw(member.getUser_pw());
		}

		int result = service.save(loginMember);

		if (result > 0) {
			model.addAttribute("loginMember", service.findById(member.getUser_id())); // DB에 있는 값으로 다시 세션값 업데이트
			model.addAttribute("msg", "회원정보를 수정하였습니다.");
			model.addAttribute("location", "/mem/myInfo");
		} else {
			model.addAttribute("msg", "회원정보 수정을 실패하였습니다.");
			model.addAttribute("location", "/mem/myInfo");
		}

		return "common/msg";
	}

	@GetMapping("/delete")
	public String delete(Model model, @SessionAttribute(name = "loginMember") Member loginMember,
			SessionStatus status) {

		if (loginMember.getUSER_STATUS().equals("K") || loginMember.getUSER_STATUS().equals("V")) {
			int result = service.deleteKaNav(loginMember);

			if (result > 0) {
				model.addAttribute("msg", "정상적으로 탈퇴 되었습니다.");
				model.addAttribute("location", "");
				status.setComplete(); // 세션을 종료하는 코드
			} else {
				model.addAttribute("msg", "회원 탈퇴에 실패하였습니다..");
				model.addAttribute("location", "/");
			}

		} else {
			int result = service.delete(loginMember.getUser_CODE());

			if (result > 0) {
				model.addAttribute("msg", "정상적으로 탈퇴 되었습니다.");
				model.addAttribute("location", "");
				status.setComplete(); // 세션을 종료하는 코드
			} else {
				model.addAttribute("msg", "회원 탈퇴에 실패하였습니다..");
				model.addAttribute("location", "/");
			}

		}

		return "common/msg";

	}

	@GetMapping("/bookmark")
	public String bookmark(Model model, @RequestParam Map<String, String> param) {

		System.out.println(param.toString());

		int result = 0;
		String msg = "";
		String location = "";

		switch (Integer.parseInt(param.get("bmc_code"))) {
		case 1:
			// 명소
			location = "/Des/detail?de_id=" + param.get("code");
			break;

		case 2:
			// 숙소
			location = "/room/view?code=" + param.get("code");
			break;

		case 3:
			// 맛집
			location = "/res/view?no=" + param.get("code");
			break;

		case 4:
			// 축제
			location = "/festival/FestivalDetail?fe_id=" + param.get("code");
			break;

		case 5:
			// 착한가게
			Kind k = kService.findByNoKind(Integer.parseInt(param.get("code")));
			location = "/kind/view?kind_id=" + param.get("code") + "&kind_add=" + k.getAdress().split(" ")[1];
			break;

		}

		if (param.get("User_CODE") != null && param.get("User_CODE").length() > 0) {
			if (param.get("code") != null) {
				result = service.insertBookMarkRoom(param);
			}
		} else {
			msg = "로그인 후 이용해주세요.";

			model.addAttribute("msg", msg);
			model.addAttribute("location", location);
			return "/common/msg";
		}

		if (result == 1) {
			msg = "찜 목록에 추가 되었습니다.";
		} else {
			msg = "찜 목록 추가에 실패 하였습니다.";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("location", location);
		return "/common/msg";
	}
	
	@GetMapping("/deleteResReser")
	public String deleteResReser(Model model, int gp_code) { 
		
		int deleteResReser = service.deleteResReser(gp_code);
		if(deleteResReser >0) {
			model.addAttribute("deleteResReser", deleteResReser);
			model.addAttribute("msg", "취소에 성공했습니다.");
			model.addAttribute("location", "");
			return "common/msg";
		}else {
			model.addAttribute("msg", "취소에 실패하였습니다.");
			model.addAttribute("location", "/");
			return "common/msg";
		}
	}
	
	@GetMapping("/deleteRoomReser")
	public String deleteRoomReser(Model model, int ar_code) { 
		
		int deleteRoomReser = service.deleteRoomReser(ar_code);
		if(deleteRoomReser >0) {
			model.addAttribute("deleteRoomReser", deleteRoomReser);
			model.addAttribute("msg", "취소에 성공했습니다.");
			model.addAttribute("location", "");
			return "common/msg";
		}else {
			model.addAttribute("msg", "취소에 실패하였습니다.");
			model.addAttribute("location", "/");
			return "common/msg";
		}
	}

}