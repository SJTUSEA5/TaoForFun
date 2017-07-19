package action;

import java.util.List;

import model.Weibotag;
import service.WeibotagService;

public class ShowWeibotagAction extends BaseAction{

private static final long serialVersionUID = 1L;
	
	private WeibotagService weibotagService;
	private int weiboid;
	
	
	public void setWeibotagService(WeibotagService weibotagService){
		this.weibotagService = weibotagService;
	}
	
	public int getWeiboid(){
		return weiboid;
	}
	
	public void setWeiboid(int weiboid){
		this.weiboid = weiboid;
	}
	
	@Override
	public String execute() throws Exception{
		List<Weibotag> weibotags = weibotagService.getWeibotagByWeiboid(weiboid);
		request().setAttribute("weibotags", weibotags);
		return SUCCESS;
	}
	
}
