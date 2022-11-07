package fp.busan.mvc.restaurant.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fp.busan.mvc.restaurant.mapper.RestaurantMapper;
import fp.busan.mvc.restaurant.model.vo.Restaurant;
import fp.busan.pr.common.util.PageInfo;


@Service
public class RestaurantServiceImpl implements RestaurantService {

	@Autowired
	private RestaurantMapper mapper;
	
	@Override
	public List<Restaurant> ResAllList() {
		return mapper.selectResAllList();
	}
	
	@Override
	public List<Restaurant> reCommendList() {
		return mapper.selectreCommendList();
	}
	@Override
	public List<Restaurant> restaurantMainSearch(PageInfo pageInfo,Map<String, String> map) {
		Map<String, String> searchMap = new HashMap<String, String>();
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		String detail = map.get("detail");
		String gugunnm = map.get("gugunnm");
			searchMap.put("detail", detail);
			searchMap.put("gugunnm", gugunnm);
		String sort = map.get("sort");		
			if(sort != null && sort.length()>0) {
				searchMap.put("sort", sort);
			} else {
				searchMap.put("sort", "res_id");
			}
		return mapper.restaurantMainSearch(rowBounds,searchMap);
	}

	@Override
	public List<Restaurant> restaurantSubSearch(PageInfo pageInfo,Map<String, String> map) {
		Map<String, String> searchMap = new HashMap<String, String>();
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		String detail = map.get("detail");
		String gugunnm = map.get("gugunnm");
		String pricefrom= map.get("pricefrom");
		String priceto= map.get("priceto");
		String time = map.get("time");
			searchMap.put("detail", detail);
			searchMap.put("gugunnm", gugunnm);
			searchMap.put("pricefrom", pricefrom);
			searchMap.put("priceto", priceto);
			searchMap.put("time", time);
		String sort = map.get("sort");		
			if(sort != null && sort.length()>0) {
				searchMap.put("sort", sort);
			} else {
				searchMap.put("sort", "res_id");
			}
		return mapper.selectRestaurantSubSearch(rowBounds,searchMap);
	}

	@Override
	public int insertReser(Map<String, String> map) {
		System.out.println("map : "+map);
		int result = 0;
			result = mapper.insertReservation(map);
		return result;
	}

	  
	@Override
	public int restaurantCount(Map<String, String> map) {
		Map<String, String> searchMap = new HashMap<String, String>();
		String detail = map.get("detail");
		String gugunnm = map.get("gugunnm");
			searchMap.put("detail", detail);
			searchMap.put("gugunnm", gugunnm);
		return mapper.selectRestaurantCount(searchMap);
	}

	@Override
	public int restaurantSubCount(Map<String, String> map) {
		Map<String, String> searchMap = new HashMap<String, String>();
		String detail = map.get("detail");
		String gugunnm = map.get("gugunnm");
		String  pricefrom= map.get("pricefrom");
		String  priceto= map.get("priceto");
		String time = map.get("time");
			searchMap.put("detail", detail);
			searchMap.put("gugunnm", gugunnm);
			searchMap.put("pricefrom", pricefrom);
			searchMap.put("priceto", priceto);
			searchMap.put("time", time);
			
			
		return mapper.selectRestaurantSubCount(searchMap);
	}

	@Override
	public Restaurant restaurantView(int res_id) {
		Restaurant restaurant = mapper.selectRestaurantView(res_id);
		restaurant.setReadcount(restaurant.getReadcount() + 1); // 조회수 늘리는 코드
		mapper.updateReadCount(restaurant);
		return restaurant;
	}

	@Override
	public Restaurant restaurantResName(Map<String, String> map) {
		String res_name = map.get("res_name");
		return mapper.selectRestaurantResname(res_name);
	}



	

}
