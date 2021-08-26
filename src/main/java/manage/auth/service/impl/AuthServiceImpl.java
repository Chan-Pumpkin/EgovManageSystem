package manage.auth.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import manage.auth.mapper.AuthMapper;
import manage.auth.service.AuthService;
import manage.auth.service.UserVO;

@Service
public class AuthServiceImpl implements AuthService {
	
	@Autowired
	private AuthMapper authMapper;
	
	/**
	 * 로그인
	 */
	public Map<String, String> login(UserVO userVO) {
		Map<String, String> resultMap = new HashMap<>();
		
		UserVO user = authMapper.selectUserByEmail(userVO.getEmail());
		
		if(user == null) {
			resultMap.put("type", "fail");
			resultMap.put("message", "존재하지 않는 이메일 입니다.");
		} else {
			
			if(user.getPassword().equals(userVO.getPassword())) {
				//if(user.getPassword().equals(egovPasswordEncoder.encryptPassword(userVO.getPassword()))) {
				ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
				HttpSession httpSession = servletRequestAttributes.getRequest().getSession();
				httpSession.setAttribute("userVO", user);
				resultMap.put("type", "success");
			} else {
				resultMap.put("type", "fail");
				resultMap.put("message", "비밀번호가 일치하지 않습니다.");
			}
			
		}
		
		return resultMap;
	}
}
