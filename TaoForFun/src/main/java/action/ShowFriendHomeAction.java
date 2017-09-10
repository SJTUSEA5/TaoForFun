package action;

import model.User;
import model.Usertag;
import model.Friendpair;
import model.Thumbup;
import model.Weibo;
import service.FriendpairService;
import service.ThumbupService;
import service.UsertagService;
import service.WeiboService;
import service.UserService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ShowFriendHomeAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;
	
	private int userid;
	
	private FriendpairService friendpairService;
	private UsertagService usertagService;
	private WeiboService weiboService;
	private UserService userService;

	private ThumbupService thumbupService;
	
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
	
	public void setUsertagService(UsertagService usertagService){
		this.usertagService = usertagService;
	}
	
	public void setThumbupService(ThumbupService thumbupService){
		this.thumbupService = thumbupService;
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
		List<Usertag> futs = usertagService.getUsertagByUserid(userid);
		Map<Integer, Boolean> thumbupCheck = new HashMap<Integer, Boolean>();
		for(Weibo w : fweibos){
			Thumbup thumbup = thumbupService.getThumbupByUsernameAndWeiboid(username, w.getWeiboid());
			if(thumbup!=null){
				thumbupCheck.put(w.getWeiboid(), true);
			}
			else{
				thumbupCheck.put(w.getWeiboid(), false);
			}
		}
		request().setAttribute("thumbupCheck", thumbupCheck);
		request().setAttribute("futs", futs);
		request().setAttribute("fweibos", fweibos);
		request().setAttribute("friend", friend);
		
		return SUCCESS;
		
	}

}