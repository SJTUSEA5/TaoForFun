package action;

import model.Friendapplication;
import model.User;

import service.FriendapplicationService;

public class ApplyFriendsAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	
	private String username2;
	
	private FriendapplicationService friendapplicationService;
	
	public String getUsername2(){
		return this.username2;
	}
	
	public void setUsername2(String username2){
		this.username2 = username2;
	}
	
	public void setFriendpairService(FriendapplicationService friendapplicationService){
		this.friendapplicationService = friendapplicationService;
	}
	
	@Override
	public String execute() throws Exception {
		String username1 = ((User) session.get("user")).getUsername();
		Friendapplication friendapplication = new Friendapplication(username1, username2);
		if(friendapplicationService.addFriendapplication(friendapplication))
			return "success";
		else
			return "input";
	}
}
