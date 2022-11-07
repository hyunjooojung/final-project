package fp.busan.mvc.room.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fp.busan.mvc.room.mapper.RoomMapper;
import fp.busan.mvc.room.model.vo.Room;
import fp.busan.pr.common.util.PageInfo;

@Service
public class RoomServiceImpl implements RoomService {

	@Autowired
	private RoomMapper mapper;

	@Override
	public int getRoomCount(Map<String, String> map) {

		Map<String, String> searchMap = new HashMap<String, String>();

		if (map.get("search") != null) {
			searchMap.put("searchKeyword", map.get("search"));
		}
		if (map.get("place") != null) {
			searchMap.put("placeKeyword", map.get("place"));
		}

		return mapper.getRoomCount(searchMap);
	}

	@Override
	public List<Room> getRoomList(PageInfo pageInfo, Map<String, String> map) {

		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());

		Map<String, String> searchMap = new HashMap<String, String>();

		if (map.get("search") != null) {
			searchMap.put("searchKeyword", map.get("search"));
		}
		if (map.get("place") != null) {
			searchMap.put("placeKeyword", map.get("place"));
		}
		if (map.get("sortKeyword") != null) {
			searchMap.put("sortKeyword", map.get("sortKeyword"));
		}
		return mapper.getRoomList(rowBounds, searchMap);
	}

	@Override
	public Room selectDetailByCode(int code) {
		Room room = mapper.selectDetailByCode(code);

		mapper.updateReadCount(code);
		return room;
	}



	@Override
	public int insertACReservation(String user_code, String code, String in, String out, String people) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_code", user_code);
		map.put("code", code);
		map.put("in", in);
		map.put("out", out);
		map.put("people", people);
		int result = mapper.insertACReservation(map);
		return result;
	}

}
