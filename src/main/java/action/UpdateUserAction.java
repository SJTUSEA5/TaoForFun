package action;

import model.User;
import service.UserService;

public class UpdateUserAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	
	private int userid;
	private String username;
	private String password;
	private String email;
	private String role;
	
	private UserService userService;
	
	public int getUserid(){
		return userid;
	}
	
	public void setUserid(int userid){
		this.userid = userid;
	}
	
	public String getUsername(){
		return username;
	}
	
	public void setUsername(String username){
		this.username = username;
	}
	
	public String getPassword(){
		return password;
	}
	
	public void setPassword(String password){
		this.password = password;
	}
	
	public String getEmail(){
		return email;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	
	public String getRole(){
		return role;
	}
	
	public void setRole(String role){
		this.role = role;
	}
	
	public void setUserService(UserService userService){
		this.userService = userService;
	}
	
	@Override
	public String execute() throws Exception{
		
		User user = userService.getUserByUserid(userid);
		user.setUsername(username);
		user.setPassword(password);
		user.setEmail(email);
		user.setRole(role);
		userService.updateUser(user);
		
		return SUCCESS;
		
	}
}
