package action;

import model.User;
import model.Friendpair;
import service.FriendpairService;
import service.UserService;

import java.util.ArrayList;
import java.util.List;

public class ShowFriendsAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;
	
	private FriendpairService friendpairService;
	private UserService userService;
	
	public void setFriendpairService(FriendpairService friendpairService){
		this.friendpairService = friendpairService;
	}
	
	public void setUserService(UserService userService){
		this.userService = userService;
	}
	
	@Override
	public String execute() throws Exception{
		
		String username = ((User) session.get("user")).getUsername();
		List<Friendpair> pairs = friendpairService.getPairByUsername(username);
		List<String> friendnames = new ArrayList<String>();
		List<User> friends = new ArrayList<User>();
		for(Friendpair pair : pairs){
			friendnames.add(pair.getUsername2());
		}
		for(String friendname : friendnames){
			friends.add(userService.getUserByUsername(friendname));
		}
		
		request().setAttribute("friends", friends);
		
		return SUCCESS;
		
	}

}