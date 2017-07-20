package action;

import model.User;
import service.UserService;

public class RegisterAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;

	private String username;
	private String password;
	private String confirmpassword;
	
	private UserService userService;
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getConfirmpassword() {
		return confirmpassword;
	}

	public void setConfirmpassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public String registerUser() {
		System.out.println(username);
		session.put("message", "");
		session.put("msg", "");
		if(password.equals(confirmpassword)){
			User user1 = userService.getUserByUsername(username); 
        	if (user1 == null){  
        		User newUser = new User(username,  password, "guest");
        		userService.addUser(newUser);
        		System.out.println(username);
                return "success";
        	}
        	else{
        		session.put("msg", "the username has been used");
        		return "input";
        	}
		}
		else{
			session.put("msg", "not the same password");
			return "input";
		}
	}

}