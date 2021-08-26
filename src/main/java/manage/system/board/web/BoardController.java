package manage.system.board.web;

import javax.enterprise.inject.Model;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import manage.system.board.service.BoardSearchVO;
import manage.system.board.service.BoardService;
import manage.system.board.service.BoardVO;

@RequestMapping("/board")
@Controller
public class BoardController {
	private final Logger LOGGER = LoggerFactory.getLogger(BoardController.class);
	private final String JSP_DIR = "system/board/";
	
	private PaginationInfo paginationInfo = new PaginationInfo();
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private EgovPropertyService propertiesService;
	
	/**
	 * 샘플 리스트 화면 조회
	 * @param boardSearchVO
	 * @param model
	 * @return
	 */
	@GetMapping("/list.do")
	public String list(BoardSearchVO boardSearchVO, ModelMap model) {
		setPage(boardSearchVO);
		
		paginationInfo.setTotalRecordCount(boardService.selectBoardListTotalCount(boardSearchVO));
		
		model.addAttribute("boardList", boardService.selectBoardList(boardSearchVO));
		model.addAttribute("paginationInfo", paginationInfo);
		
//		return JSP_DIR + "list"; 
		return JSP_DIR +"list.tiles"; 
	}
	
	/**
	 * 샘플 상세 화면 조회
	 * @param id
	 * @param model
	 * @return
	 */
	@GetMapping("/detail.do")
	public String detail(Long id, ModelMap model) {
		model.addAttribute("board", boardService.selectBoard(id));
		
		return JSP_DIR + "detail";
	}
	
	/**
	 * 샘플 등록 화면 조회
	 * @return
	 */
	@GetMapping("/insert.do")
	public String insert() {
		return JSP_DIR + "register";
	}
	
	/**
	 * 샘플 수정 화면 조회
	 * @return
	 */
	@GetMapping("/update.do")
	public String update(Long id, ModelMap model) {
		model.addAttribute("board", boardService.selectBoard(id));
		
		return JSP_DIR + "register";
	}
	
	/**
	 * 샘플 등록/수정
	 * @param boardVO
	 * @return
	 */
	@PostMapping("/register.do")
	public String register(BoardVO boardVO) {
		if(boardVO.getId() == null) {
			boardService.insertBoard(boardVO);
		} else {
			boardService.updateBoard(boardVO);
		}
		
		return "redirect:/";
	}
	
	/**
	 * 샘플 삭제
	 * @param id
	 * @return
	 */
	@PostMapping("/delete.do")
	public String delete(Long id) {
		boardService.deleteBoard(id);
		
		return "redirect:/";
	}
	
	public void setPage(BoardSearchVO boardSearchVO){
		boardSearchVO.setPageSize(propertiesService.getInt("pageSize"));
		
		paginationInfo.setCurrentPageNo(boardSearchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardSearchVO.getPageUnit());
		paginationInfo.setPageSize(boardSearchVO.getPageSize());

		boardSearchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardSearchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardSearchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	}
}
