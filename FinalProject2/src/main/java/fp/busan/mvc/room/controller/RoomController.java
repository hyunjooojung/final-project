package fp.busan.mvc.room.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import fp.busan.mvc.member.model.vo.Member;
import fp.busan.mvc.member.service.MemberService;
import fp.busan.mvc.room.model.vo.KakaoPayApprovalVO;
import fp.busan.mvc.room.model.vo.Room;
import fp.busan.mvc.room.service.KakaoPay;
import fp.busan.mvc.room.service.RoomService;
import fp.busan.pr.common.util.PageInfo;

@Controller
@RequestMapping("/room")
public class RoomController {

	@Autowired
	private RoomService service;

	@Autowired
	private MemberService mservice;
	
	@Autowired
	private KakaoPay kakaoPay;

	@RequestMapping("/list")
	public String list(Model model, @RequestParam Map<String, String> param) {
		int page = 1;
		int countResult = service.getRoomCount(param);
		if (param.containsKey("page") == true) {
			try {
				page = Integer.parseInt(param.get("page"));
			} catch (Exception e) {
			}
		}

		PageInfo pageInfo = new PageInfo(page, 6, countResult, 6);

		List<Room> list = service.getRoomList(pageInfo, param);

		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getImage() == null) {
				list.get(i).setImage(
						"http://image.kyobobook.co.kr/newimages/giftshop_new/goods/400/1890/S1558598345368.jpg");
			}
		}

		model.addAttribute("list", list);
		model.addAttribute("param", param);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("countResult", countResult);

		return "/room/roomMain";
	}

	@GetMapping("/view")
	public String view(Model model, int code) {
		Room room = service.selectDetailByCode(code);

		if (room.getImage() == null) {
			room.setImage("http://image.kyobobook.co.kr/newimages/giftshop_new/goods/400/1890/S1558598345368.jpg");
		}
		String price = String.valueOf(room.getPrice());
		int priceLength = price.length();
		String priceStart = price.substring(0, priceLength - 3);
		String priceEnd = price.substring(priceLength - 3, priceLength);
		String price2 = priceStart + "," + priceEnd;

		model.addAttribute("room", room);
		model.addAttribute("price2", price2);

		return "/room/roomView";
	}

	@GetMapping("/roomBooking")
	public String roomBooking(Model model, @RequestParam Map<String, String> param,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember) throws ParseException {

		if (loginMember == null) {
			String msg = "로그인 후 이용 부탁드립니다.";
			model.addAttribute("msg", msg);
			return "/common/msg";
		}
		String code = param.get("code");
		String bookingDate = param.get("bookingDate");
		int bookingLength = bookingDate.length();

		String checkIn = bookingDate.substring(0, bookingDate.indexOf(" to "));
		System.out.println(checkIn);
		String checkOut = bookingDate.substring((bookingLength - bookingDate.indexOf("o ") + 2), bookingLength);
		System.out.println(checkOut);
		
		Date checkInDate = new SimpleDateFormat("yyyy-MM-dd").parse(checkIn);
		System.out.println(checkInDate);
		Date checkOutDate = new SimpleDateFormat("yyyy-MM-dd").parse(checkOut);
		System.out.println(checkOutDate);
		long Sec = (checkOutDate.getTime() - checkInDate.getTime()) / 1000;
		long Days = (Sec / (24*60*60)) + 1; // 일자수
		System.out.println(Days + "일 차이");
		
		String[] checkInArr = checkIn.split("-");
		String[] checkOutArr = checkOut.split("-");

		Room room = service.selectDetailByCode(Integer.parseInt(code));

		model.addAttribute("code", code);
		model.addAttribute("room", room);
		model.addAttribute("checkIn", checkIn);
		model.addAttribute("checkOut", checkOut);
		model.addAttribute("day", String.valueOf(Days));
		model.addAttribute("checkInArr", checkInArr);
		model.addAttribute("checkOutArr", checkOutArr);
		model.addAttribute("param", param);

		return "/room/rBooking";
	}
	
	@GetMapping("/insertBooking")
	public String insertBookingGet(Model model, @RequestParam Map<String, String> param,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember) throws ParseException {
		
		String msg = "";

		
		String guests = param.get("guests");
		String checkIn = param.get("checkIn");
		String checkOut = param.get("checkOut");
		
		
		Date checkInDate = new SimpleDateFormat("yyyy-MM-dd").parse(checkIn);
		System.out.println(checkInDate);
		Date checkOutDate = new SimpleDateFormat("yyyy-MM-dd").parse(checkOut);
		System.out.println(checkOutDate);
		long Sec = (checkOutDate.getTime() - checkInDate.getTime()) / 1000;
		long Days = (Sec / (24*60*60)) + 1; // 일자수
		System.out.println(Days + "일 차이");
		
		
		
		String memberCode = Integer.toString(loginMember.getUser_CODE());

		int result = 0;
		
		result = service.insertACReservation(memberCode, param.get("code"), checkIn, checkOut, guests);

		if (result != 1) {
			msg = "예약에 실패 하였습니다.";
			model.addAttribute("msg", msg);
			return "/common/msg";
		}

		Room room = service.selectDetailByCode(Integer.parseInt(param.get("code")));
		String[] checkInArr = checkIn.split("-");
		String[] checkOutArr = checkOut.split("-");

		model.addAttribute("checkInArr", checkInArr);
		model.addAttribute("checkOutArr", checkOutArr);
		model.addAttribute("checkIn", checkIn);
		model.addAttribute("checkOut", checkOut);
		model.addAttribute("room", room);
		model.addAttribute("code", param.get("code"));
		model.addAttribute("price", param.get("price"));
		model.addAttribute("day", String.valueOf(Days));

		return "/room/rBookingCom";
	}

	@PostMapping("/insertBooking")
	public String insertBooking(Model model, @RequestParam Map<String, String> param,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember) {
		
		String msg = "";
		String guests = param.get("guests");
		String checkIn = param.get("checkIn");
		String checkOut = param.get("checkOut");
		String checkInre = checkIn.replace("-", "");
		String checkOutre = checkOut.replace("-", "");
		String memberCode = Integer.toString(loginMember.getUser_CODE());

		int result = 0;
		result = service.insertACReservation(memberCode, param.get("code"), checkIn, checkOut, guests);
		if (result != 1) {
			msg = "예약에 실패 하였습니다.";
			model.addAttribute("msg", msg);
			return "/common/msg";
		}
		
		Room room = service.selectDetailByCode(Integer.parseInt(param.get("code")));
		String[] checkInArr = checkIn.split("-");
		String[] checkOutArr = checkOut.split("-");

		model.addAttribute("checkInArr", checkInArr);
		model.addAttribute("checkOutArr", checkOutArr);
		model.addAttribute("checkIn", checkIn);
		model.addAttribute("checkOut", checkOut);
		model.addAttribute("room", room);
		model.addAttribute("code", param.get("code"));
		model.addAttribute("price", param.get("price"));
		model.addAttribute("day", Integer.parseInt(checkOutre) - Integer.parseInt(checkInre));

		return "/room/rBookingCom";
	}

	 @GetMapping("/kakaoPay")
	    public void kakaoPayGet() {
	        
	    }
	    
	    @PostMapping("/kakaoPay")
	    public String kakaoPay(@RequestParam Map<String, String> param) {
	        
	        System.out.println(param.toString());
	        return "redirect:" + kakaoPay.kakaoPayReady(param);
	 
	    }
	    
	    
	    
	    @GetMapping("/kakaoPaySuccess")
	    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
	        
	    	
	    	model.addAttribute("info", kakaoPay.kakaoPayInfo(pg_token));
	        
	    }

}
