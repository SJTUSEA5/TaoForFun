package action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.Thumbup;
import model.User;
import model.Weibo;
import service.ThumbupService;
import service.WeiboService;

public class AllWeibosAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	private WeiboService weiboService;

	private ThumbupService thumbupService;

	public void setweiboService(WeiboService weiboService) {
		this.weiboService = weiboService;
	}

	public void setThumbupService(ThumbupService thumbupService){
		this.thumbupService = thumbupService;
	}
	
	@Override
	public String execute() throws Exception {
		String username = ((User) session.get("user")).getUsername();
		List<Weibo> weibos = weiboService.getAllWeibo();
		
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
		
		request().setAttribute("weibos", weibos);
		return SUCCESS;
	}
}
