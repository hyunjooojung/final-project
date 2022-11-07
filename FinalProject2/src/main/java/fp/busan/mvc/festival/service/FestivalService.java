package fp.busan.mvc.festival.service;

import java.util.List;
import java.util.Map;

import fp.busan.mvc.festival.model.vo.Festival;
import fp.busan.pr.common.util.PageInfo;

public interface FestivalService {
	
	List<Festival> festivalAllList();
	
	List<String> dongList(Map<String, String> param);
	
	List<Festival> reCommendList();
	
	int festivalListCount(Map<String, String> map);
	
	List<Festival> festivalList(PageInfo pageinfo,Map<String, String> map);
	
	Festival festivalbyId(int fe_id);
	
	List<Festival> festivalRecommand();
	
	int readcount(int fe_id);
	
	
}
