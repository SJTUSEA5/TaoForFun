package action;

import model.User;
import service.UserService;

public class UpdateUserAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	private int userid;
	private String username;
	private String newpassword;
	private String confirmnew;
	private String role;
	private String email;

	private UserService userService;

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getNewpassword() {
		return newpassword;
	}

	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}
	
	public String getConfirmnew() {
		return confirmnew;
	}

	public void setConfirmnew(String confirmnew) {
		this.confirmnew = confirmnew;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
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

	@Override
	public String execute() throws Exception {

		User user = userService.getUserByUserid(userid);
		if(username != null)user.setUsername(username);
		System.out.println(newpassword);
		System.out.println(confirmnew);
		if((newpassword != null)&&(confirmnew != null)&&(newpassword.equals(confirmnew)))
			user.setPassword(newpassword);
		if(role != null)user.setRole(role);
		if(email != null)user.setEmail(email);
		
		userService.updateUser(user);
		session.put("user", user);
		return SUCCESS;
	}

}
