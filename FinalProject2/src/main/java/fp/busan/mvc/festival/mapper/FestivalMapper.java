package fp.busan.mvc.festival.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import fp.busan.mvc.festival.model.vo.Festival;

@Mapper
public interface FestivalMapper {
	List<Festival> selectFestivalAllList();
	List<String> selectDongList(Map<String, String> gugunnm);
	List<Festival> selectreCommendList();
	int selectFestivalListCount(Map<String, String> map);
	List<Festival> selectFestivalList(RowBounds rowBounds,Map<String, String> map);
	Festival selectFestivalbyId(int fe_id);
	List<Festival> selectFestivalRecommand();
	int updateReadcount(int fe_id);
}
