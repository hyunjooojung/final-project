package fp.busan.mvc.kind.controller;

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
import fp.busan.mvc.kind.model.vo.Kind;
import fp.busan.mvc.kind.service.KindService;
import fp.busan.pr.common.util.PageInfo;

@RequestMapping("/kind")
@Controller
public class KindController {

	@Autowired
	private KindService service;
	
	@Autowired
	private destinationService servicedes;

	@RequestMapping("/list")
	public String list(Model model,  @RequestParam Map<String, String> param) {
		int page = 1;
		int countResult = service.getKindCount(param);
		
		if(param.containsKey("page") == true) {
			try {
				page = Integer.parseInt(param.get("page"));
			} catch (Exception e) {}
		}
		PageInfo pageInfo = new PageInfo(page, 3, service.getKindCount(param), 9);
		
		// 서비스 들고오기
	    List<Kind> list = service.getKindList(pageInfo,param);
	    model.addAttribute("list", list);
		model.addAttribute("param", param);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("countResult", countResult);
		return "/kind/kind_search";
	}

	@GetMapping("/view")
	public String view(Model model, int kind_id, @RequestParam Map<String, String> param) {
		Kind kind = service.findByNoKind(kind_id);
		List<Destination> des = servicedes.selectBygugun(param);
		if (kind == null) {
			return "redirect:error";
		}

		model.addAttribute("kind", kind);
		model.addAttribute("des", des);
		
		return "/kind/kind_detail";
	}

}
