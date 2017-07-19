package action;

import model.Weibotag;
import service.WeibotagService;

public class DeleteWeibotagAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;
	
	private int tagid;
	
	private WeibotagService weibotagService;
	
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
		Weibotag weibotag = weibotagService.getWeibotagByTagid(tagid);
		weibotagService.deleteWeibotag(weibotag);
		return SUCCESS;
	}

}
