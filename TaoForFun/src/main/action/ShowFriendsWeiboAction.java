package action;

import java.util.List;

import model.Weibo;
import model.User;
import model.Friendpair;
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
	public String execute() throws Exception {
		String username = ((User) session.get("user")).getUsername();
		List<Friendpair> friendpairs = friendpairService.getPairByUsername(username);
		List<Weibo> weibos = weiboService.getWeiboByUsername(username);
		for(int i = 0; i < friendpairs.size(); i++){
			List<Weibo> friendweibos = weiboService.getWeiboByUsername(friendpairs.get(i).getUsername2());
			weibos.addAll(friendweibos);
		}
		
		request().setAttribute("weibos", weibos);
		//add mine and my friends'
		return SUCCESS;
	}
	
}
