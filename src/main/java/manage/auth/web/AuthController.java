package manage.auth.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import manage.auth.service.AuthService;
import manage.auth.service.UserVO;
import manage.system.board.service.BoardVO;

@RequestMapping("/auth")
@Controller
public class AuthController {
	private final String JSP_DIR = "system/auth/";
	
	@Autowired
	private AuthService AuthService;
	
	/**
	 * 로그인 화면으로 이동
	 * @return
	 */
	@GetMapping("/login.do")
	public String login() {
		return JSP_DIR + "login";
	}
	
	@PostMapping("/login.do")
	public ModelAndView login(UserVO userVO) {
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("result", AuthService.login(userVO));
		modelAndView.setViewName("jsonView");
		
		return modelAndView;
	}
	
	
	@GetMapping("/register.do")
	public String registerPage() {
		return JSP_DIR + "register";
	}
	
	/**
	 * 사용자관리 추가
	 * 
	 * @param employerVO
	 * @return
	 */
	
	/**
	 * 샘플 등록/수정
	 * @param boardVO
	 * @return
	 */
	/*
	@PostMapping("/insert.do")
	public String register(UserVO userVO) {
		AuthService.insertEmail(userVO);
 
		return JSP_DIR + "login";
	}
	*/
	/*
	@PostMapping("/insert.do")
	public String register(UserVO userVO) {
		AuthService.insertEmail(userVO);
 
		return "redirect:/";
	}
	*/
	/*
	@PostMapping("/insert.do")
	public ModelAndView insert(UserVO userVO, ModelMap model) {
		ModelAndView modelAndView = new ModelAndView();
		
		AuthService.insertEmail(userVO);
		
		modelAndView.setViewName("jsonView");
		modelAndView.addObject("result", "success");
		
		return modelAndView;
	}
*/
	
	@PostMapping("/insert.do")
	public ModelAndView insert(UserVO userVO, ModelMap model) {
		ModelAndView modelAndView = new ModelAndView();
		
		AuthService.insertEmail(userVO);
		
		modelAndView.setViewName("jsonView");
		modelAndView.addObject("result", "success");
		
		return modelAndView;
	}
	
}
