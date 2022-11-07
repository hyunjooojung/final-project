package fp.busan.mvc.board.service;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fp.busan.mvc.board.mapper.BoardMapper;
import fp.busan.mvc.board.model.vo.Board;
import fp.busan.mvc.board.model.vo.Comment;
import fp.busan.pr.common.util.PageInfo;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;

	@Override

	public List<Board> getBoardList(PageInfo pageInfo, Map<String, String> param) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		
		Map<String, String> searchMap = new HashMap<String, String>();
		String searchValue = param.get("searchValue");
		String cate = param.get("boardCategory");
		
		if(searchValue != null && searchValue.length() > 0 ) {
			String type = param.get("searchType");
			if(type.equals("title")) {
				searchMap.put("titleKeyword", searchValue);
				
			}else if(type.equals("content")) {
				searchMap.put("contentKeyword", searchValue);
				
			} else if(type.equals("writer")) {
				searchMap.put("writerKeyword", searchValue);
				
			}
		}
		if(cate != null) {
			searchMap.put("boardCategoryNo", cate);
		}
		return mapper.selectBoardList(rowBounds, searchMap);
	}

	@Override
	public int getBoardCount(Map<String, String> param) {
		Map<String, String> searchMap = new HashMap<String, String>();
		String searchValue = param.get("searchValue");
		String cate = param.get("boardCategory");
		
		if(searchValue != null && searchValue.length() > 0 ) {
			String type = param.get("searchType");
			if(type.equals("title")) {
				searchMap.put("titleKeyword", searchValue);
				
			}else if(type.equals("content")) {
				searchMap.put("contentKeyword", searchValue);
				
			} else if(type.equals("writer")) {
				searchMap.put("writerKeyword", searchValue);
				
			} 
		}
		
		if(cate != null) {
			searchMap.put("boardCategoryNo", cate);
		}
		System.out.println(searchMap);
		return mapper.selectBoardCount(searchMap);
	}

	@Override
	public Board findByNo(int b_code) {
		Board board = mapper.selectBoardByNo(b_code);
		int result = mapper.updateReadCount(board);
		return board;
	}

	@Override
	public List<Comment> findCommentByNo(int b_code) {
		List<Comment> comment = mapper.selectCommentByNo(b_code);
		return comment;
	}

	@Override
	public int getCommentByNoCount(int b_code) {
		int result = mapper.selectCommentByNoCount(b_code);
		return result;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int deleteBoard(int b_code) {
		return mapper.deleteBoard(b_code);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int deleteComment(int c_code) {
		return mapper.deleteComment(c_code);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int saveBoard(Board board) {
		int result = 0;

		if(board.getB_code() == 0) {
			result = mapper.insertBoard(board);
		}else {
			result = mapper.updateBoard(board);
			System.out.println("업데이트 완료");
			System.out.println(board.getB_ccode());
		}			
		return result;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int saveComment(Comment comment) {
		int result = 0;

		if(comment.getC_code() == 0) {
			result = mapper.insertComment(comment);
		}else {
			result = mapper.updateComment(comment);
		}
		return result;
	}

}
