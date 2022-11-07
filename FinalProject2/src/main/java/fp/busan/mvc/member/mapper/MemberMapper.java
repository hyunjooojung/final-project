package fp.busan.mvc.member.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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

// @Mapper : DAO 없이 자동으로 Mapper 객체를 생성해주는 어노테이션. 별도의 DAO 작성이 필요 없어진다.
// ※ 주의 : mapper의 id와 동일한 메소드 네이밍을 맞춰야한다.

@Mapper
public interface MemberMapper {
	int selectCount();
	List<Member> selectAll();
	Member selectMember(String user_id); //@Param : 파라메터를 알려주는 어노테이션, 없어도 호환잘된다.
	int insertMember(Member member);
	int updateMember(Member member);
	int updatePwd(Map<String, String> map);
	int deleteMember(@Param("User_CODE") int User_CODE);
	int insertBookMarkRoom(Map<String, String> map);
	List<Restaurant> selectResBookList(int user_CODE);
	List<Destination> selectDesBookList(int user_CODE);
	List<Kind> selectKindBookList(int user_CODE);
	List<Festival> selectFesBookList(int user_CODE);
	List<Room> selectRoomBookList(int user_CODE);
	List<BookMark> selectBmcCode(int user_CODE);
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
	int insertKaNavMember(Member member);
	Member findByIdKaNav(Map<String, String> map);
	int deleteKaNav(Member member);
	
}
