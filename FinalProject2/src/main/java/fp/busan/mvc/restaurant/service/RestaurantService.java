package fp.busan.mvc.restaurant.service;

import java.util.List;
import java.util.Map;

import fp.busan.mvc.restaurant.model.vo.Restaurant;
import fp.busan.pr.common.util.PageInfo;

public interface RestaurantService {
	List<Restaurant> ResAllList();
	
	List<Restaurant> reCommendList();
	
	List<Restaurant> restaurantMainSearch(PageInfo pageInfo, Map<String, String> map);

	List<Restaurant> restaurantSubSearch(PageInfo pageInfo,Map<String, String> map);
	Restaurant restaurantResName(Map<String, String> map);
	
	int insertReser(Map<String, String> map);
	
	int restaurantCount(Map<String, String> map);
	
	int restaurantSubCount(Map<String, String> map);
	Restaurant restaurantView(int res_id);
}
