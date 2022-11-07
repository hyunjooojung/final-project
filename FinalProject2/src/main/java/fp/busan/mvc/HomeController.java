package fp.busan.mvc;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import fp.busan.mvc.board.model.vo.Board;
import fp.busan.mvc.board.service.BoardService;
import fp.busan.mvc.kind.model.vo.Kind;
import fp.busan.mvc.kind.service.KindService;
import fp.busan.mvc.member.model.vo.Member;
import fp.busan.mvc.restaurant.model.vo.Restaurant;
import fp.busan.mvc.restaurant.service.RestaurantService;
import fp.busan.pr.common.util.PageInfo;

/**
 * Handles requests for the application home page.
 */
@SessionAttributes("loginMember") // loginMember를 model에서 취급할때 Session으로 처리하는 파라메터
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	RestaurantService reService;
	
	@Autowired
	KindService kService;
	
	@Autowired
	BoardService boService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		logger.info("Welcome home! The client locale is {}.", locale);
		
//		Member m = new Member();
//		m.setUser_CODE(1);m.setUser_id("test@naver.com");m.setUser_pw("1111");m.setUser_name("test");m.setUser_phone("010-1111-1111");m.setUser_email("test@naver.com");m.setUSER_STATUS("Y");model.addAttribute("loginMember",m);
		
		List<Restaurant> relist = reService.reCommendList();
		List<Kind> klist = kService.reCommend(); 
		
		Map<String, String> param = new HashMap<String, String>();
		
		param.put("boardCategory", "1");
				
		int page = 1;
		PageInfo pageInfo = new PageInfo(page, 10, boService.getBoardCount(param), 10);
		List<Board> blist = boService.getBoardList(pageInfo, param);
		
		Board b = boService.findByNo(7);
		
		model.addAttribute("blist",blist);		// 게시판 리스트
		model.addAttribute("b",b);				// 리뷰
//		model.addAttribute("loginMember",m);	// 로그인
		model.addAttribute("relist",relist);	// 맛집
		model.addAttribute("klist",klist);		// 착한가게
		
		return "home";
	}
	
}
