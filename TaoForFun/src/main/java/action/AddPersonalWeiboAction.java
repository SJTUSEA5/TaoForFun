package action;

import model.Weibo;
import service.WeiboService;

public class AddPersonalWeiboAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	
	private WeiboService weiboService;
	private String content;
	
	
	public String getContent(){
		return content;
	}
	
	public void setContent(String content){
		this.content = content;
	}
	
	public void setWeiboService(WeiboService weiboService){
		this.weiboService = weiboService;
	}
	
	public String checkContent(){
		if(session.get("content") == null)
			if (!((content == null || content.length()<=0)||(content.length()>140)))
				return "success";
			else
				return "input";
		else
			return "input";
	}
	
	
}
