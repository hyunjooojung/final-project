package fp.busan.mvc.room.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import fp.busan.mvc.room.model.vo.Room;

@Mapper
public interface RoomMapper {
	int getRoomCount(Map<String, String> map);
	List<Room> getRoomList(RowBounds rowBounds, Map<String, String> map);
	Room selectDetailByCode(int code);
	int insertACReservation(Map<String, String> map);
	int updateReadCount(int code);
}
