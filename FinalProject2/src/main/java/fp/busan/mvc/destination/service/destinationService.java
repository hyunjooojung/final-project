package fp.busan.mvc.destination.service;

import java.util.List;
import java.util.Map;

import fp.busan.mvc.destination.model.vo.Destination;
import fp.busan.pr.common.util.PageInfo;

public interface destinationService {

	// 검색 조회
	List<Destination> selectDesAllList();

	// 검색 조회
	List<Destination> selectDesSearch(PageInfo pageInfo, Map<String, String> map);

	// 검색 개수
	int selectDesCount(Map<String, String> map);

	// 추천 명소
	List<Destination> reCommandDes();

	// 상세 조회
	Destination selectById(Map<String, String> map);

	// 조회수 업데이트
	int updateById(Map<String, String> map);

	// 착한가격 상세 조회
	List<Destination> selectBygugun(Map<String, String> map);

}