package fp.busan.mvc.festival.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fp.busan.mvc.festival.mapper.FestivalMapper;
import fp.busan.mvc.festival.model.vo.Festival;
import fp.busan.pr.common.util.PageInfo;

@Service
public class FestivalServiceImpl implements FestivalService {

	@Autowired
	private FestivalMapper mapper;

	@Override
	public List<Festival> festivalAllList() {
		return mapper.selectFestivalAllList();
	}
	
	@Override
	public List<String> dongList(Map<String , String> location) {
		Map<String, String> searchMap = new HashMap<String , String>();

		if(location.get("location") != null && location.get("location").length() > 0) {
			searchMap.put("gugunnm", location.get("location"));
		}
		else {
			searchMap.put("gugunnm", "중구");
		}
		
		return mapper.selectDongList(searchMap);
	}

	@Override
	public List<Festival> reCommendList() {
		return mapper.selectreCommendList();
	}

	@Override
	public int festivalListCount(Map<String, String> map) {
		Map<String, String> searchMap = new HashMap<String, String>();
		
		String title = map.get("title");
		if(title != null && title.length()>0) {
			searchMap.put("title", title);
		}
				
		String time = map.get("time");
		if(time != null && time.length()>0) {
			searchMap.put("time", time);
		}
		
		String gugunnm = map.get("location");
		if(gugunnm != null && gugunnm.length()>0) {
			searchMap.put("gugunnm", gugunnm);
		}
		
		String amount = map.get("fare");
		if(amount != null && amount.length()>0) {
			searchMap.put("amount", amount);
		}
		
		String middle_size_rm1 = map.get("convenient");		
		if(middle_size_rm1 != null && middle_size_rm1.length()>0) {
			searchMap.put("middle_size_rm1", middle_size_rm1);
		}
		
		System.out.println("searchMap : " + searchMap.toString());
		
		System.out.println(mapper.selectFestivalListCount(searchMap));
		
		return mapper.selectFestivalListCount(searchMap);
	}

	@Override
	public List<Festival> festivalList(PageInfo pageInfo,Map<String, String> map) {
		Map<String, String> searchMap = new HashMap<String, String>();
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		String title = map.get("title");
		if(title != null && title.length()>0) {
			searchMap.put("title", title);
		}
				
		String time = map.get("time");
		if(time != null && time.length()>0) {
			searchMap.put("time", time);
		}
		
		
		String gugunnm = map.get("location");
		if(gugunnm != null && gugunnm.length()>0) {
			searchMap.put("gugunnm", gugunnm);
		}
		
		String amount = map.get("fare");
		if(amount != null && amount.length()>0) {
			searchMap.put("amount", amount);
		}
		
		String middle_size_rm1 = map.get("convenient");		
		if(middle_size_rm1 != null && middle_size_rm1.length()>0) {
			searchMap.put("middle_size_rm1", middle_size_rm1);
		}
		
		String sort = map.get("sort");		
		if(sort != null && sort.length()>0) {
			searchMap.put("sort", sort);
		} else {
			searchMap.put("sort", "fe_id");
		}
		
//		System.out.println(searchMap.toString());
		
		return mapper.selectFestivalList(rowBounds,searchMap);
	}

	@Override
	public Festival festivalbyId(int fe_id) {
 		return mapper.selectFestivalbyId(fe_id);
	}

	@Override
	public List<Festival> festivalRecommand() { 
		return mapper.selectFestivalRecommand();
	}

	@Override
	public int readcount(int fe_id) {
		return mapper.updateReadcount(fe_id);
	}


	
}
