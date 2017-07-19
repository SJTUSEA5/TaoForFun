package action;

import model.Weibo;
import service.WeiboService;

public class DeletePersonalWeiboAction extends BaseAction{
private static final long serialVersionUID = 1L;
	
	private int weiboid;
	
	private WeiboService weiboService;
	
	public int getWeiboid(){
		return weiboid;
	}
	
	public void setWeiboid(int weiboid){
		this.weiboid = weiboid;
	}
	
	public void setWeiboService(WeiboService weiboService){
		this.weiboService = weiboService;
	}
	
	@Override
	public String execute() throws Exception {
		
		System.out.println(weiboid);
		Weibo weibo = weiboService.getWeiboByWeiboid(weiboid);
		weiboService.deleteWeibo(weibo);
		
		return SUCCESS;
	}
}
