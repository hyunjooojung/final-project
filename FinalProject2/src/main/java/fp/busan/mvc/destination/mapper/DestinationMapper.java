package fp.busan.mvc.destination.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import fp.busan.mvc.destination.model.vo.Destination;

@Mapper
public interface DestinationMapper {

	// 전체 리스트
	List<Destination> selectDesAllList();

	// 검색 리스트
	List<Destination> selectDesSearch(RowBounds rowBounds, Map<String, String> map);

	// 검색 갯수
	int selectDesCount(Map<String, String> map);

	// 추천 명소
	List<Destination> reCommandDes();

	// 상세 조회
	Destination selectById(Map<String, String> map);

	// 조회수 업데이트
	int updateById(Map<String, String> map);

	// 착한 가격 구군 검색
	List<Destination> selectBygugun(String kind_add);
}
