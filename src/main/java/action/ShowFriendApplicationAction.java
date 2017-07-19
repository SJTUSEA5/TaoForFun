package action;

import model.User;

import java.util.List;
import java.util.ArrayList;

import model.Friendapplication;

import service.FriendapplicationService;
import service.UserService;

public class ShowFriendApplicationAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	private FriendapplicationService friendapplicationService;
	private UserService userService;
	
	public void setFriendapplicationService(FriendapplicationService friendapplicationService){
		this.friendapplicationService = friendapplicationService;
	}
	
	public void setUserService(UserService userService){
		this.userService = userService;
	}
	
	@Override
	public String execute() throws Exception{
		String username = ((User) session.get("user")).getUsername();
		List<User> users = new ArrayList<User>();
		List<Friendapplication> friendapplications = friendapplicationService.getApplicationByUsername(username);
		for(Friendapplication friendapplicaiton : friendapplications){
			String username1 = friendapplicaiton.getUsername1();
			User user = userService.getUserByUsername(username1);
			users.add(user);
		}
		request.put("users", users);
		return SUCCESS;
	}
	
}
