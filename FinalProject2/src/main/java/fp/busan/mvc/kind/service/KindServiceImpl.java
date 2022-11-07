package fp.busan.mvc.kind.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fp.busan.mvc.kind.mapper.KindMapper;
import fp.busan.mvc.kind.model.vo.Kind;
import fp.busan.pr.common.util.PageInfo;

@Service
public class KindServiceImpl implements KindService {

	@Autowired
	private KindMapper mapper;
	
	// 검색 리스트
	@Override
	public List<Kind> getKindList(PageInfo pageInfo, Map<String, String> map) {

		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());

		Map<String, String> searchMap = new HashMap<String, String>();

		if (map.get("adress") != null) {
			searchMap.put("adressKeyword", map.get("adress"));
		}
		
		if (map.get("parking") != null) {
			searchMap.put("parkingKeyword", map.get("parking"));
		}
		
		if (map.get("cn") != null) {
			searchMap.put("titleKeyword", map.get("cn"));
		}
		
		if (map.get("search") != null) {
			searchMap.put("searchKeyword", map.get("search"));
		}
		
		if (map.get("sort") != null) {
			searchMap.put("sortKeyword", map.get("sort"));
		}
		
		return mapper.selectKindSearch(rowBounds, searchMap);
	}
	
	// 검색 카운트
	@Override
	public int getKindCount(Map<String, String> map) {

		Map<String, String> searchMap = new HashMap<String, String>();

		if (map.get("adress") != null) {
			searchMap.put("adressKeyword", map.get("adress"));
		}
		
		if (map.get("parking") != null) {
			searchMap.put("parkingKeyword", map.get("parking"));
		}
		
		if (map.get("cn") != null) {
			searchMap.put("titleKeyword", map.get("cn"));
		}
		
		if (map.get("search") != null) {
			searchMap.put("searchKeyword", map.get("search"));
		}
		
		if (map.get("sort") != null) {
			searchMap.put("sortKeyword", map.get("sort"));
		}

		return mapper.selectKindCount(searchMap);
	}


	@Override // 상세 페이지
	public Kind findByNoKind(int kind_id) {
		Kind kind = mapper.selectKindByNo(kind_id);
		kind.setCnt(kind.getCnt() + 1); // 조회수 늘리는 코드
		
		mapper.updateReadCount(kind);
		return kind;
		
	}

	@Override // 조회수
	public int updateReadCount(int no) {
		return 0;
	}

	@Override
	public List<Kind> reCommend() {
		return mapper.reCommend();
	}
	
	
}
