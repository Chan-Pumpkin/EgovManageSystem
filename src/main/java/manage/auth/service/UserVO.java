package manage.auth.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserVO {
	private String email;
	private String password;
	private String name;
}
