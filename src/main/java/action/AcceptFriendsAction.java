package action;

import model.Friendpair;
import model.User;
import model.Friendapplication;

import service.FriendpairService;
import service.FriendapplicationService;

public class AcceptFriendsAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	
	private String username2;
	
	private FriendpairService friendpairService;
	private FriendapplicationService friendapplicationService;
	
	public String getUsername2(){
		return this.username2;
	}
	
	public void setUsername2(String username2){
		this.username2 = username2;
	}
	
	public void setFriendpairService(FriendpairService friendpairService){
		this.friendpairService = friendpairService;
	}
	
	public void setFriendapplicationService(FriendapplicationService friendapplicationService){
		this.friendapplicationService = friendapplicationService;
	}
	
	@Override
	public String execute() throws Exception {
		String username1 = ((User) session.get("user")).getUsername();
		Friendpair friendpair1 = new Friendpair(username1, username2);
		Friendpair friendpair2 = new Friendpair(username2, username1);
		if(friendpairService.addFriendpair(friendpair1) && friendpairService.addFriendpair(friendpair2)){
			Friendapplication friendapplication = friendapplicationService.getApplicationByUsernames(username2, username1);
			friendapplicationService.deleteFriendapplication(friendapplication);
			return "success";
		}
		else{
			return "input";
		}
	}
}
