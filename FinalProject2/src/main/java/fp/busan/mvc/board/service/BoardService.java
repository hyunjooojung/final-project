package fp.busan.mvc.board.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import fp.busan.mvc.board.model.vo.Board;
import fp.busan.mvc.board.model.vo.Comment;
import fp.busan.pr.common.util.PageInfo;

public interface BoardService {
	
	List<Board> getBoardList(PageInfo pageInfo, Map<String, String> param);
	int getBoardCount(Map<String, String> param);
	Board findByNo(int b_code);
	List<Comment> findCommentByNo(int b_code);
	int getCommentByNoCount(int b_code);
	int deleteBoard(int b_code);
	int deleteComment(int c_code);
	int saveBoard(Board board);
	int saveComment(Comment comment);
	
	/*
	List<Board> selectBoardList(RowBounds rowBounds, Map<String, String> map); // 0
	int selectBoardCount(Map<String, String> map); // 0
	Board selectBoardByNo(int b_code); // 0
	Comment selectCommentByNo(int b_code); // 0
	int selectCommentByNoCount(int b_code);// 0
	
	int insertBoard(Board board); // 0
	int insertComment(Comment comment); // 0
	
	int updateBoard(Board board); // 0
	int updateComment(Comment comment); // 0
	
	int updateReadCount(Board board); ★
	
	int deleteBoard(int b_code); // 0
	int deleteComment(int c_code); // 0
	*/
	
}
