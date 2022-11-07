package fp.busan.mvc.destination.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fp.busan.mvc.destination.mapper.DestinationMapper;
import fp.busan.mvc.destination.model.vo.Destination;
import fp.busan.pr.common.util.PageInfo;

@Service
public class DestinationServiceImpl implements destinationService {

	@Autowired
	private DestinationMapper mapper;

	@Override
	public List<Destination> selectDesAllList() {
		return mapper.selectDesAllList();
	}

	@Override
	public List<Destination> selectDesSearch(PageInfo pageInfo, Map<String, String> map) {
		Map<String, String> searchMap = new HashMap<String, String>();
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		String name = map.get("name");
		if(name != null && name.length()>0) {
			searchMap.put("name", name);
		}
				
		String gugunnm = map.get("gugunnm");
		if(gugunnm != null && gugunnm.length()>0) {
			searchMap.put("gugunnm", gugunnm);
		}
		
		String middle_size_rm = map.get("middle_size_rm");
		if(middle_size_rm != null && middle_size_rm.length()>0) {
			searchMap.put("middle_size_rm", middle_size_rm);
		}
		
		String homePage = map.get("homePage");		
		if(homePage != null && homePage.length()>0) {
			searchMap.put("homePage", homePage);
		}
		
		String trfcInfo = map.get("trfcInfo");		
		if(trfcInfo != null && trfcInfo.length()>0) {
			searchMap.put("trfcInfo", trfcInfo);
		}
		
		String sort = map.get("sort");		
		if(sort != null && sort.length()>0) {
			searchMap.put("sort", sort);
		}
		
		
		return mapper.selectDesSearch(rowBounds,searchMap);
	}

	@Override
	public int selectDesCount(Map<String, String> map) {
		Map<String, String> searchMap = new HashMap<String, String>();
				
		String name = map.get("name");
		if(name != null && name.length()>0) {
			searchMap.put("name", name);
		}
				
		String gugunnm = map.get("gugunnm");
		if(gugunnm != null && gugunnm.length()>0) {
			searchMap.put("gugunnm", gugunnm);
		}
		
		String middle_size_rm = map.get("middle_size_rm");
		if(middle_size_rm != null && middle_size_rm.length()>0) {
			searchMap.put("middle_size_rm", middle_size_rm);
		}
		
		String homePage = map.get("homePage");		
		if(homePage != null && homePage.length()>0) {
			searchMap.put("homePage", homePage);
		}
		
		String trfcInfo = map.get("trfcInfo");		
		if(trfcInfo != null && trfcInfo.length()>0) {
			searchMap.put("trfcInfo", trfcInfo);
		}
		
		return mapper.selectDesCount(searchMap);
	}

	@Override
	public List<Destination> reCommandDes() {
		return mapper.reCommandDes();
	}

	@Override
	public Destination selectById(Map<String, String> map) {
		
		mapper.updateById(map);
		return mapper.selectById(map);
	}

	@Override
	public int updateById(Map<String, String> map) {
		return mapper.updateById(map);
	}
	
	@Override
	public List<Destination> selectBygugun(Map<String, String> map) {
		String kind_add = map.get("kind_add");
		return mapper.selectBygugun(kind_add);
	}


}
