package action;

import java.util.List;

import model.Weibo;
import service.WeiboService;

public class ShowPersonalWeiboAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	
	private String username;
	
	private WeiboService weiboService;
	
	public String getUsername(){
		return username;
	}
	
	public void setUsername(String username){
		this.username = username;
	}
	
	public void setWeiboService(WeiboService weiboService){
		this.weiboService = weiboService;
	}
	
	@Override
	public String execute() throws Exception {
		System.out.println(username);
		List<Weibo> myweibos = weiboService.getWeiboByUsername(username);
		session().setAttribute("myweibos", myweibos);
		
		return SUCCESS;
	}
	
}
