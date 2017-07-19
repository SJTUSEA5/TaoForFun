package action;

import model.User;
import service.UserService;

public class SearchUserAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	
	private String username;
	private UserService userService;
	
	public String getUsername(){
		return this.username;
	}
	
	public void setUsername(String username){
		this.username = username;
	}
	
	public void setUserService(UserService userService){
		this.userService = userService;
	}
	
	@Override
	public String execute() throws Exception {
		User user = userService.getUserByUsername(username);
		if(user == null){
			return "success";
		}
		else{
			request().setAttribute("searchuser", user);
			return "success";
		}
		
	}
}
