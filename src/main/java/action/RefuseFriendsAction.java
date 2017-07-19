package action;

import model.User;
import model.Friendapplication;

import service.FriendapplicationService;

public class RefuseFriendsAction extends BaseAction{
	
private static final long serialVersionUID = 1L;
	
	private String username1;
	
	private FriendapplicationService friendapplicationService;
	
	public String getUsername1(){
		return this.username1;
	}
	
	public void setUsername1(String username1){
		this.username1 = username1;
	}
	
	public void setFriendapplicationService(FriendapplicationService friendapplicationService){
		this.friendapplicationService = friendapplicationService;
	}
	
	@Override
	public String execute() throws Exception{
		
		String username2 = ((User)session.get("user")).getUsername();
		Friendapplication friendapplication = friendapplicationService.getApplicationByUsernames(username1, username2);
		friendapplicationService.deleteFriendapplication(friendapplication);
		
		return SUCCESS;
		
	}
	
}