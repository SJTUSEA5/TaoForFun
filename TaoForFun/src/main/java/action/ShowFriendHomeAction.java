package action;

import model.User;
import model.Friendpair;
import model.Weibo;
import service.FriendpairService;
import service.WeiboService;
import service.UserService;

import java.util.ArrayList;
import java.util.List;

public class ShowFriendHomeAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;
	
	private int userid;
	
	private FriendpairService friendpairService;
	private WeiboService weiboService;
	private UserService userService;
	
	public int getUserid() {
		return userid;
	}
	
	public void setUserid(int userid) {
		this.userid = userid;
	}
	
	public void setFriendpairService(FriendpairService friendpairService){
		this.friendpairService = friendpairService;
	}
	
	public void setWeiboService(WeiboService weiboService){
		this.weiboService = weiboService;
	}
	
	public void setUserService(UserService userService){
		this.userService = userService;
	}
	
	@Override
	public String execute() throws Exception{
		
		String username = ((User) session.get("user")).getUsername();
		User friend = userService.getUserByUserid(userid);
		List<String> friendlist = new ArrayList<String>();
		friendlist.add(friend.getUsername());
		java.sql.Timestamp time = new java.sql.Timestamp(new java.util.Date().getTime());
		java.sql.Timestamp limitTime = new java.sql.Timestamp(time.getTime() - 3*24*60*60*1000);
		List<Weibo> fweibos = weiboService.getWeiboByFriendlist(friendlist, limitTime);
		
		request().setAttribute("fweibos", fweibos);
		request().setAttribute("friend", friend);
		
		return SUCCESS;
		
	}

}