package action;

import java.util.List;

import model.Weibo;
import model.User;
import service.WeiboService;

public class ShowPersonalWeiboAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	
	
	private WeiboService weiboService;
	
	public void setWeiboService(WeiboService weiboService){
		this.weiboService = weiboService;
	}
	
	@Override
	public String execute() throws Exception {
		String username = ((User) session.get("user")).getUsername();
		List<Weibo> myweibos = weiboService.getWeiboByUsername(username);
		session().setAttribute("myweibos", myweibos);
		
		return SUCCESS;
	}
	
}
