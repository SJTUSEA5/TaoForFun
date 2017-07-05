package action;

import model.User;
import service.UserService;
public class LoginAction extends BaseAction{
	private static final long serialVersionUID = 1L;

	private String loginname;
	private String password;

	private UserService userService;

	public String getLoginname() {
		return loginname;
	}

	public void setLoginnamename(String loginname) {
		this.loginname = loginname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public String checkLogin(){
		if(session.get("user") == null)
			return "success";
		else
			return "input";
	}
	
	
	@Override
	public String execute() throws Exception {
		User user = new User(loginname, password);
		if (userService.checkUser(user)){
			session.put("user", user);
			return "success";
		}
		else{
			return "input";
		}
	}
	
}