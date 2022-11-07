package fp.busan.mvc.kind.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import fp.busan.mvc.kind.model.vo.Kind;

@Mapper
public interface KindMapper {
	
	// 검색 리스트
	List<Kind> selectKindSearch(RowBounds rowBounds,Map<String,String> map);
	
	// 검색 갯수
	int selectKindCount(Map<String, String> map);
	
	// 상세 조회
	Kind selectKindByNo(int kind_id);
	
	// 조회수 
	int updateReadCount(Kind kind);
	
	// 추천 조회
	List<Kind> reCommend();
	
}
