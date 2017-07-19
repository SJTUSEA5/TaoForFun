package action;

import model.Weibotag;
import service.WeibotagService;

public class AddWeibotagAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	private int weiboid;
	private String tag;
	
	private WeibotagService weibotagService;
	
	public int getWeiboid(){
		return weiboid;
	}
	
	public void setWeiboid(int weiboid){
		this.weiboid = weiboid;
	}
	
	public String getTag(){
		return tag;
	}
	
	public void setTag(String tag){
		this.tag = tag;
	}
	
	public void setWeibotagService(WeibotagService weibotagService){
		this.weibotagService = weibotagService;
	}
	
	@Override
	public String execute() throws Exception{
		Weibotag weibotag = new Weibotag(weiboid, tag);
		weibotagService.addWeibotag(weibotag);
		return SUCCESS;
	}
	
}
