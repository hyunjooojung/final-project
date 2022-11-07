package fp.busan.mvc.member.service;

import java.util.List;
import java.util.Map;

import fp.busan.mvc.board.model.vo.Board;
import fp.busan.mvc.destination.model.vo.Destination;
import fp.busan.mvc.festival.model.vo.Festival;
import fp.busan.mvc.kind.model.vo.Kind;
import fp.busan.mvc.member.model.vo.ACReservation;
import fp.busan.mvc.member.model.vo.BookMark;
import fp.busan.mvc.member.model.vo.GPReservation;
import fp.busan.mvc.member.model.vo.Member;
import fp.busan.mvc.member.model.vo.ResReser;
import fp.busan.mvc.member.model.vo.RoomReser;
import fp.busan.mvc.restaurant.model.vo.Restaurant;
import fp.busan.mvc.room.model.vo.Room;

public interface MemberService {
Member login(String id, String pwd);
	
	int save(Member member);
	
	boolean validate(String userId);
	
	Member findById(String id);
	
	int delete(int no);
	
	int updatePwd(Member loginMember, String userPwd);
	
	int insertBookMarkRoom(Map<String, String> map);
	
	List<Restaurant> ResBookList(int user_CODE);
	List<Destination> DesBookList(int user_CODE);
	List<Kind> KindBookList(int user_CODE);
	List<Festival> FesBookList(int user_CODE);
	List<Room> RoomBookList(int user_CODE);
	List<BookMark> BmcCode(int user_CODE);
	int selectBmcCodeCount(int user_CODE);
	
	List<GPReservation> selectResReservationList(int user_CODE);
	List<ACReservation> selectRoomReservationList(int user_code);
	List<RoomReser> selectRoomReservationDetail(int user_code);
	List<ResReser> selectResReservationDetail(int user_code);
	int selectResReservationCount(int user_CODE);
	int selectRoomReservationCount(int user_code);
	
	
	List<Board> selectBoardList(int user_code);
	List<Member> selectMemberList(int user_code);
	
	int deleteResReser(int gp_code);
	int deleteRoomReser(int ar_code);
	
	//kakao & naver
	
	Member findByIdKaNav(Map<String, String> map);

	int deleteKaNav(Member member);

	
	
}
