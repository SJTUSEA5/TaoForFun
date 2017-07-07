package action;

import model.User;
import service.UserService;

public class RegisterAction extends BaseAction{
	private static final long serialVersionUID = 1L;

	private String username;
	private String email;
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
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public String registerUser() {
//		if(password == confirmpassword){
//			User user1 = userService.getUserByUsername(username); 
//        	User user2 = userService.getUserByEmail(email);
//        	if (user1 == null && user2 == null){  
//        		User newUser = new User(username, email, password, "Guest");
//        		if (userService.addUser(newUser) == true){
//        			session.put("user", newUser);
//        			return "success";
//        		}
//        		else
//        			return "input";
//        	}
//        	else{
//        		return "input";
//        	}
//		}
//		else{
//			return "input";
//		}
		return SUCCESS;
	}
		
}