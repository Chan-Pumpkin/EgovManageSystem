package manage.auth.mapper;

import manage.auth.service.UserVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface AuthMapper {
	public UserVO selectUserByEmail(String email);
	public UserVO insertEmail(String email);
}
