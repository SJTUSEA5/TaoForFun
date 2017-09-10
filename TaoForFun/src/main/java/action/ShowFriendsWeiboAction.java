package action;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.Friendpair;
import model.Thumbup;
import model.User;
import model.Weibo;
import service.WeiboService;
import service.FriendpairService;
import service.ThumbupService;

public class ShowFriendsWeiboAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;
	
	private WeiboService weiboService;
	private FriendpairService friendpairService;

	private ThumbupService thumbupService;
	
	public void setWeiboService(WeiboService weiboService){
		this.weiboService = weiboService;
	}
	
	public void setFriendpairService(FriendpairService friendpairService){
		this.friendpairService = friendpairService;
	}
	
	public void setThumbupService(ThumbupService thumbupService){
		this.thumbupService = thumbupService;
	}
	
	@Override
	public String execute() throws Exception{
		String username = ((User)session.get("user")).getUsername();
		java.sql.Timestamp time = new java.sql.Timestamp(new java.util.Date().getTime());
		java.sql.Timestamp limitTime = new java.sql.Timestamp(time.getTime() - 3*24*60*60*1000);
		List<Friendpair> pairs = friendpairService.getPairByUsername(username);
		List<String> friendnames = new ArrayList<String>();
		for(Friendpair pair : pairs){
			if(!friendnames.contains(pair.getUsername1()))
				friendnames.add(pair.getUsername1());
			if(!friendnames.contains(pair.getUsername2()))
				friendnames.add(pair.getUsername2());
		}
		List<Weibo> weibos = weiboService.getWeiboByFriendlist(friendnames, limitTime);
		Collections.reverse(weibos);
		request().setAttribute("weibos", weibos);
		
		Map<Integer, Boolean> thumbupCheck = new HashMap<Integer, Boolean>();
		for(Weibo w : weibos){
			Thumbup thumbup = thumbupService.getThumbupByUsernameAndWeiboid(username, w.getWeiboid());
			if(thumbup!=null){
				thumbupCheck.put(w.getWeiboid(), true);
			}
			else{
				thumbupCheck.put(w.getWeiboid(), false);
			}
		}
		request().setAttribute("thumbupCheck", thumbupCheck);
		
		return SUCCESS;
	}
	
}