package fp.busan.mvc.restaurant.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fp.busan.mvc.restaurant.model.vo.Restaurant;
import fp.busan.mvc.restaurant.service.RestaurantService;
import fp.busan.pr.common.util.PageInfo;

@RequestMapping("/res")
@Controller
public class RestaurantController {

	@Autowired
	private RestaurantService service;
	
	@GetMapping("/Res")
	public String listAll(Model model) {
		List<Restaurant> Flist = service.reCommendList();
		List<Restaurant> list = service.ResAllList();
		
		model.addAttribute("list",list);
		model.addAttribute("Flist",Flist);
		return "restaurant/Restaurant_main";
	}
	
	
	
	@RequestMapping("/mainSearch")
	public String MainSearch(Model model,  @RequestParam Map<String, String> param) {
		int page = 1;
		int count = service.restaurantCount(param);
		if(param.containsKey("page") == true) {
			try {
				page = Integer.parseInt(param.get("page"));
			} catch (Exception e) {}
		}
		PageInfo pageInfo = new PageInfo(page, 9, count, 9);
		List<Restaurant> list = service.restaurantMainSearch(pageInfo,param);
		model.addAttribute("list",list);
		model.addAttribute("param",param);
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("count",count);
		
		return "restaurant/Restaurant_search";
	}
	
	@GetMapping("/view")
	public String view(Model model, @RequestParam("no") int no) {
		System.out.println("no : " + no);
		Restaurant restaurant = service.restaurantView(no);
		List<Restaurant> list = service.ResAllList();
		model.addAttribute("list",list);
		if(restaurant == null) {
			return "redirect:error";
		}
		
		model.addAttribute("restaurant", restaurant);
		System.out.println(restaurant);
		
		return "restaurant/Restaurant_detail";
	}
	
	
	@GetMapping("/subSearch")
	public String subSearch(Model model,  @RequestParam Map<String, String> param) {
		System.out.println(param);
		int page = 1;
		int count = service.restaurantSubCount(param);
		if(param.containsKey("page") == true) {
			try {
				page = Integer.parseInt(param.get("page"));
			} catch (Exception e) {}
		}
		PageInfo pageInfo = new PageInfo(page, 9, count, 9);
		List<Restaurant> list = service.restaurantSubSearch(pageInfo,param);
		model.addAttribute("list",list);
		model.addAttribute("param",param);
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("count",count);
		
		return "restaurant/Restaurant_search2";
	}
	
	@GetMapping("/reservation")
	public String reservation(Model model,  @RequestParam Map<String, String> param) {
		
		int insert = service.insertReser(param);
		
		Restaurant resList = service.restaurantResName(param);
		System.out.println("resList : " + resList);
		model.addAttribute("resList",resList);
		model.addAttribute("resParam",param);
		model.addAttribute("insert",insert);
		
		
		return "restaurant/Restaurant_reservation";
	}
	
	
	
	
	
}
