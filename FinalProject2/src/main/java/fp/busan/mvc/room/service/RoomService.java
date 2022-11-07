package fp.busan.mvc.room.service;

import java.util.List;
import java.util.Map;

import fp.busan.mvc.room.model.vo.Room;
import fp.busan.pr.common.util.PageInfo;


public interface RoomService {
	int getRoomCount(Map<String, String> map);
	List<Room> getRoomList(PageInfo pageInfo, Map<String, String> map);
	Room selectDetailByCode(int code);
	int insertACReservation(String user_code, String code, String in, String out, String people);
}
