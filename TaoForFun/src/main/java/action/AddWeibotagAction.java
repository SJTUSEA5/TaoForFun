package action;

import model.Tag;
import model.Weibotag;
import service.WeibotagService;

public class AddWeibotagAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	private int weiboid;
	private int tagid;
	
	private WeibotagService weibotagService;
	
	public int getWeiboid(){
		return weiboid;
	}
	
	public void setWeiboid(int weiboid){
		this.weiboid = weiboid;
	}
	
	public int getTagid(){
		return tagid;
	}
	
	public void setTagid(int tagid){
		this.tagid = tagid;
	}
	
	public void setWeibotagService(WeibotagService weibotagService){
		this.weibotagService = weibotagService;
	}
	
	@Override
	public String execute() throws Exception{
		Weibotag weibotag = new Weibotag(tagid, weiboid);
		weibotagService.addWeibotag(weibotag);
		return SUCCESS;
	}
	
}