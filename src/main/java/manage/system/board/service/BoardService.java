package manage.system.board.service;

import java.util.List;

public interface BoardService {
	
	/**
	 * 샘플 리스트 조회
	 * @param boardSearchVO
	 * @return
	 */
	public List<BoardVO> selectBoardList(BoardSearchVO boardSearchVO);
	
	/**
	 * 샘플 리스트 토탈 카운트
	 * @param boardSearchVO
	 * @return
	 */
	public int selectBoardListTotalCount(BoardSearchVO boardSearchVO);
	
	/**
	 * 단일 샘플 조회
	 * @param boardSearchVO
	 * @return
	 */
	public BoardVO selectBoard(Long id);
	
	/**
	 * 샘플 등록
	 * @param boardVO
	 */
	public void insertBoard(BoardVO boardVO);
	
	/**
	 * 샘플 수정
	 * @param boardVO
	 */
	public void updateBoard(BoardVO boardVO);
	
	/**
	 * 샘플 삭제
	 * @param id
	 */
	public void deleteBoard(Long id);
}
