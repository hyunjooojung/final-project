package fp.busan.mvc.board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import fp.busan.mvc.board.model.vo.Board;
import fp.busan.mvc.board.model.vo.Comment;

@Mapper
public interface BoardMapper {
	
	List<Board> selectBoardList(RowBounds rowBounds, Map<String, String> map);
	int selectBoardCount(Map<String, String> map);
	Board selectBoardByNo(int b_code);
	List<Comment> selectCommentByNo(int b_code);
	int selectCommentByNoCount(int b_code);
	int insertBoard(Board board);
	int insertComment(Comment comment);
	int updateBoard(Board board);
	int updateComment(Comment comment);
	int updateReadCount(Board board);
	int deleteBoard(int b_code);
	int deleteComment(int c_code);
	
}
