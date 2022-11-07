package fp.busan.mvc.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fp.busan.mvc.board.model.vo.Board;
import fp.busan.mvc.destination.model.vo.Destination;
import fp.busan.mvc.festival.model.vo.Festival;
import fp.busan.mvc.kind.model.vo.Kind;
import fp.busan.mvc.member.mapper.MemberMapper;
import fp.busan.mvc.member.model.vo.ACReservation;
import fp.busan.mvc.member.model.vo.BookMark;
import fp.busan.mvc.member.model.vo.GPReservation;
import fp.busan.mvc.member.model.vo.Member;
import fp.busan.mvc.member.model.vo.ResReser;
import fp.busan.mvc.member.model.vo.RoomReser;
import fp.busan.mvc.restaurant.model.vo.Restaurant;
import fp.busan.mvc.room.model.vo.Room;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;

	@Override
	public Member login(String userId, String userPwd) {
		Member member = this.findById(userId);
		if (userId.equals("admin@naver.com")) { // admin일 경우 테스트를 위해 비밀번호 확인하지 않음
			return member;
		}

		if (member != null) {
			// 성공일때!!
			return member;
		} else {
			// 인증 실패하였을때
			return null;
		}
	}

	// @Transactional : DB 트랜잭션 관리를 위한 어노테이션. 만일 오류 발생할시 자동으로 롤백을 지원하고, 아니면 커밋
	// (rollbackFor = Exception.class) : 사용하지 않은 경우! 트랜잭션 관리기능이 작동하지 않음!!

	// @Transactional : DB 트랜잭션 관리를 위한 어노테이션. 만일 오류 발생할시 자동으로 롤백을 지원하고, 아니면 커밋
	// (rollbackFor = Exception.class) : 사용하지 않은 경우! 트랜잭션 관리기능이 작동하지 않음!!
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int save(Member member) {
		System.out.println(member);
		int result = 0;

		if (member.getUSER_STATUS() != null && member.getUSER_STATUS().length() > 0) {
			if (member.getUser_CODE() != 0) {
				result = mapper.updateMember(member);
			} else {
				result = mapper.insertKaNavMember(member);
			}
		} else {
			if (member.getUser_CODE() != 0) {
				result = mapper.updateMember(member);
			} else {
				result = mapper.insertMember(member);
			}
		}

		return result;
	}

	@Override
	public boolean validate(String userId) {
		return this.findById(userId) != null;
	}

	@Override
	public Member findById(String userId) {
		return mapper.selectMember(userId);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int delete(int no) {
		return mapper.deleteMember(no);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int updatePwd(Member loginMember, String userPwd) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("User_CODE", "" + loginMember.getUser_CODE());
		map.put("newPwd", loginMember.getUser_pw());
		return mapper.updatePwd(map);
	}

	@Override
	public int insertBookMarkRoom(Map<String, String> map) {
		return mapper.insertBookMarkRoom(map);
	}

	@Override
	public List<Restaurant> ResBookList(int user_CODE) {
		return mapper.selectResBookList(user_CODE);
	}

	@Override
	public List<Destination> DesBookList(int user_CODE) {
		return mapper.selectDesBookList(user_CODE);
	}

	@Override
	public List<Kind> KindBookList(int user_CODE) {
		return mapper.selectKindBookList(user_CODE);
	}

	@Override
	public List<Festival> FesBookList(int user_CODE) {
		return mapper.selectFesBookList(user_CODE);
	}

	@Override
	public List<Room> RoomBookList(int user_CODE) {
		return mapper.selectRoomBookList(user_CODE);
	}

	@Override
	public List<BookMark> BmcCode(int user_CODE) {
		return mapper.selectBmcCode(user_CODE);
	}

	@Override
	public int selectBmcCodeCount(int user_CODE) {
		return mapper.selectBmcCodeCount(user_CODE);
	}

	@Override
	public List<GPReservation> selectResReservationList(int user_CODE) {
		return mapper.selectResReservationList(user_CODE);
	}

	@Override
	public List<ACReservation> selectRoomReservationList(int user_code) {
		return mapper.selectRoomReservationList(user_code);
	}

	@Override
	public List<ResReser> selectResReservationDetail(int user_code) {
		return mapper.selectResReservationDetail(user_code);
	}

	@Override
	public List<RoomReser> selectRoomReservationDetail(int user_code) {
		return mapper.selectRoomReservationDetail(user_code);
	}

	@Override
	public int selectResReservationCount(int user_CODE) {
		return mapper.selectResReservationCount(user_CODE);
	}

	@Override
	public int selectRoomReservationCount(int user_code) {
		return mapper.selectRoomReservationCount(user_code);
	}

	@Override
	public List<Board> selectBoardList(int user_code) {
		return mapper.selectBoardList(user_code);
	}

	@Override
	public List<Member> selectMemberList(int user_code) {
		return mapper.selectMemberList(user_code);
	}

	@Override
	public int deleteResReser(int gp_code) {
		return mapper.deleteResReser(gp_code);
	}

	@Override
	public int deleteRoomReser(int ar_code) {
		return mapper.deleteRoomReser(ar_code);
	}

	// kakao

	@Override
	public Member findByIdKaNav(Map<String, String> map) {
		return mapper.findByIdKaNav(map);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int deleteKaNav(Member member) {
		return mapper.deleteKaNav(member);
	}

}
