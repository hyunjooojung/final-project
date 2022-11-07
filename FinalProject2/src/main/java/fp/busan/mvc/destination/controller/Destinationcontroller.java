package fp.busan.mvc.destination.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fp.busan.mvc.destination.model.vo.Destination;
import fp.busan.mvc.destination.service.destinationService;
import fp.busan.mvc.festival.model.vo.Festival;
import fp.busan.pr.common.util.PageInfo;

@RequestMapping("/Des")
@Controller
public class Destinationcontroller {
	
	@Autowired
	private destinationService service;
	
	@RequestMapping("/list")
	public String list(Model model,  @RequestParam Map<String, String> param) {
		int page = 1;
		if(param.containsKey("page") == true) {
			try {
				page = Integer.parseInt(param.get("page"));
			} catch (Exception e) {}
		}
		PageInfo pageInfo = new PageInfo(page, 3, service.selectDesCount(param), 9);
		List<Destination> list = service.selectDesSearch(pageInfo, param);
		List<Destination> relist = service.reCommandDes();
		System.out.println("controller" + param.toString());
		model.addAttribute("param",param);
		model.addAttribute("count",service.selectDesCount(param));
		model.addAttribute("list" ,list);
		model.addAttribute("relist",relist);
		model.addAttribute("pageInfo",pageInfo);
		
		return "/destination/destination_search";
	}
	
	@GetMapping("/detail")
	public String detail(Model model,  @RequestParam Map<String, String> param) {
		
		Destination d = service.selectById(param);
		model.addAttribute("d",d);
		
		return "/destination/destination_detail";
	}


}
