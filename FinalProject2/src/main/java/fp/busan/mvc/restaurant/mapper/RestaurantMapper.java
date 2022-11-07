package fp.busan.mvc.restaurant.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import fp.busan.mvc.restaurant.model.vo.Restaurant;

@Mapper
public interface RestaurantMapper {
	List<Restaurant> selectResAllList();
	List<Restaurant> selectreCommendList();
	List<Restaurant> restaurantMainSearch(RowBounds rowBounds,Map<String,String> map);
	List<Restaurant> selectRestaurantSubSearch(RowBounds rowBounds,Map<String,String> map);
	Restaurant selectRestaurantView(int res_id);
	Restaurant selectRestaurantResname(String res_name);
	int updateReadCount(Restaurant restaurant);
	int insertReservation(Map<String,String> map);
	int selectRestaurantCount(Map<String, String> map);
	int selectRestaurantSubCount(Map<String, String> map);
}
