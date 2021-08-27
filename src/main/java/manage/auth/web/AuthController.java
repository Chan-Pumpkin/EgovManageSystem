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
	/*
	@PostMapping("/register.do")
	public String register(UserVO userVO, ModelMap model) {
		setPage(employerSearchVO);
		insertEmployer(employerVO);
		paginationInfo.setTotalRecordCount(employerService.selectEmployerListTotalCount(employerSearchVO));

		model.addAttribute("employerList", employerService.selectEmployerList(employerSearchVO));
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("searchEmployerChoice", employerSearchVO.getSearchEmployerChoice());
		model.addAttribute("searchEmployerKeyword", employerSearchVO.getSearchEmployerKeyword());

		return "redirect:/system/employer/list.do";
	}
	*/
}
