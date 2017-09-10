package action;

import model.Weibotag;
import service.WeibotagService;
import java.util.List;

public class DeleteWeibotagAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;
	
	private int tagid;
	private int weiboid;
	
	private WeibotagService weibotagService;
	
	public int getTagid(){
		return tagid;
	}
	
	public void setTagid(int tagid){
		this.tagid = tagid;
	}
	
	public int getWeiboid(){
		return weiboid;
	}
	
	public void setWeiboid(int weiboid){
		this.weiboid = weiboid;
	}
	
	public void setWeibotagService(WeibotagService weibotagService){
		this.weibotagService = weibotagService;
	}
	
	@Override
	public String execute() throws Exception{
		List<Weibotag> weibotags = weibotagService.getWeibotagByTagid(tagid);
		Weibotag weibotag = new Weibotag();
		for(Weibotag wt : weibotags) {
			if(wt.getWeiboid() == weiboid) {
				weibotag = wt;
				break;
			}
		}
		weibotagService.deleteWeibotag(weibotag);
		return SUCCESS;
	}

}