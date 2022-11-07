package fp.busan.mvc.festival.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fp.busan.mvc.festival.model.vo.Festival;
import fp.busan.mvc.festival.service.FestivalService;
import fp.busan.mvc.member.service.MemberService;
import fp.busan.pr.common.util.PageInfo;

@RequestMapping("/festival")
@Controller
public class FestivalController {
	
	@Autowired
	private FestivalService service;
	
	@GetMapping("/main")
	public String Festivalmain(Model model, @RequestParam Map<String, String> param) {
		
		List<Festival> Flist = service.reCommendList();
		List<String> Glist = service.dongList(param);
		
		model.addAttribute("param",param);
		System.out.println(param.get("location"));
		model.addAttribute("Glist",Glist);
		model.addAttribute("Flist",Flist);
		
		return "festival/festivalMain";
	}
	
	@RequestMapping("/FestivalSearch")
	public String FestivalSearch(Model model, @RequestParam Map<String, String> param) {
		int page = 1;
		if(param.containsKey("page") == true) {
			try {
				page = Integer.parseInt(param.get("page"));
			} catch (Exception e) {}
		}
		PageInfo pageInfo = new PageInfo(page, 3, service.festivalListCount(param), 9);
		List<Festival> list = service.festivalList(pageInfo, param);
		
		System.out.println(list.size());
	
		model.addAttribute("count",service.festivalListCount(param));
		model.addAttribute("list",list);
		model.addAttribute("param",param);
		model.addAttribute("pageInfo",pageInfo);
		return "festival/festivalSearch";
	}
	
	@GetMapping("/FestivalDetail")
	public String FestivalDetail(Model model, @RequestParam Map<String, String> param) {
		
		int fe_id = Integer.parseInt(param.get("fe_id"));
		int result = service.readcount(fe_id);
		System.out.println("업데이트 결과 : " + result);
		
		if(result > 0) {
			Festival f = service.festivalbyId(fe_id);
			List<Festival> flist = service.festivalRecommand();
			model.addAttribute("f", f);
			model.addAttribute("flist", flist);
			return "festival/festivalDetail";
		} else {
			return "common/404";
		}
	}
	
	
	
}
