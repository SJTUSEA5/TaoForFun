package action;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import model.Friendpair;
import model.User;
import model.Weibo;
import service.WeiboService;
import service.FriendpairService;

public class ShowFriendsWeiboAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;
	
	private WeiboService weiboService;
	private FriendpairService friendpairService;
	
	public void setWeiboService(WeiboService weiboService){
		this.weiboService = weiboService;
	}
	
	public void setFriendpairService(FriendpairService friendpairService){
		this.friendpairService = friendpairService;
	}
	
	@Override
	public String execute() throws Exception{
		String username = ((User)session.get("user")).getUsername();
		java.sql.Timestamp time = new java.sql.Timestamp(new java.util.Date().getTime());
		java.sql.Timestamp limitTime = new java.sql.Timestamp(time.getTime() - 3*24*60*60*1000);
		List<Friendpair> pairs = friendpairService.getPairByUsername(username);
		List<String> friendnames = new ArrayList<String>();
		for(Friendpair pair : pairs){
			friendnames.add(pair.getUsername2());
		}
		friendnames.add(username);
		List<Weibo> weibos = weiboService.getWeiboByFriendlist(friendnames, limitTime);
		Collections.reverse(weibos);
		request().setAttribute("weibos", weibos);
		return SUCCESS;
	}
	
}
