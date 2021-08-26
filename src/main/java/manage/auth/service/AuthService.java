package manage.auth.service;

import java.util.Map;

public interface AuthService {
	public Map<String, String> login(UserVO userVO);
}
