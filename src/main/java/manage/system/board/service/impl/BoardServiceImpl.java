package manage.system.board.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import manage.system.board.mapper.BoardMapper;
import manage.system.board.service.BoardSearchVO;
import manage.system.board.service.BoardService;
import manage.system.board.service.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Resource(name = "boardMapper")
	private BoardMapper boardMapper;
	
	/**
	 * 샘플 리스트 조회
	 */
	public List<BoardVO> selectBoardList(BoardSearchVO boardSearchVO) {
		return boardMapper.selectBoardList(boardSearchVO);
	}
	
	/**
	 * 샘플 리스트 토탈 카운트
	 */
	public int selectBoardListTotalCount(BoardSearchVO boardSearchVO) {
		return boardMapper.selectBoardListTotalCount(boardSearchVO);
	}
	
	/**
	 * 단일 샘플 조회
	 */
	public BoardVO selectBoard(Long id) {
		return boardMapper.selectBoard(id);
	}
	
	/**
	 * 샘플 등록
	 */
	public void insertBoard(BoardVO boardVO) {
		boardMapper.insertBoard(boardVO);
	}
	
	/**
	 * 샘플 수정
	 */
	public void updateBoard(BoardVO boardVO) {
		boardMapper.updateBoard(boardVO);
	}
	
	/**
	 * 샘플 삭제
	 */
	public void deleteBoard(Long id) {
		boardMapper.deleteBoard(id);
	}
}
