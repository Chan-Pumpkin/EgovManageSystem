package manage.auth.service;

import java.util.Map;

public interface AuthService {
	public Map<String, String> login(UserVO userVO);
	
	/**
	 * 사용자관리 등록
	 * @param employerVO
	 */
	public void insertEmail(UserVO userVO); 
	/* public String insertEmail(UserVO userVO); */
}
