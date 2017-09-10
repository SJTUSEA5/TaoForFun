package action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.Thumbup;
import model.Weibo;
import model.User;
import service.WeiboService;
import service.ThumbupService;

public class ShowPersonalWeiboAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	
	private WeiboService weiboService;
	private ThumbupService thumbupService;
	
	public void setWeiboService(WeiboService weiboService){
		this.weiboService = weiboService;
	}
	
	public void setThumbupService(ThumbupService thumbupService){
		this.thumbupService = thumbupService;
	}
	
	@Override
	public String execute() throws Exception {
		String username = ((User) session.get("user")).getUsername();
		List<Weibo> myweibos = weiboService.getWeiboByUsername(username);
		
		Map<Integer, Boolean> thumbupCheck = new HashMap<Integer, Boolean>();
		for(Weibo w : myweibos){
			Thumbup thumbup = thumbupService.getThumbupByUsernameAndWeiboid(username, w.getWeiboid());
			if(thumbup!=null){
				thumbupCheck.put(w.getWeiboid(), true);
			}
			else{
				thumbupCheck.put(w.getWeiboid(), false);
			}
		}
		request().setAttribute("thumbupCheck", thumbupCheck);
		
		
		session().setAttribute("myweibos", myweibos);
		
		return SUCCESS;
	}
	
}
