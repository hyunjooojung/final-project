package fp.busan.mvc.kind.service;

import java.util.List;
import java.util.Map;

import fp.busan.mvc.kind.model.vo.Kind;
import fp.busan.pr.common.util.PageInfo;

public interface KindService {
	
	// 검색 리스트
	List<Kind> getKindList(PageInfo pageInfo, Map<String, String> map);
	
	// 검색 개수
	int getKindCount(Map<String, String> map);
	
	// 상세 조회
	Kind findByNoKind(int kind_id);
	
	// 조회수 
	int updateReadCount(int no);
	
	List<Kind> reCommend();
	
}
