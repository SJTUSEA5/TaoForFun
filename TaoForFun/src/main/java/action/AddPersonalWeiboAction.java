package action;

import java.util.ArrayList;
import java.util.List;

import model.User;
import model.Weibo;
import model.Weibotag;
import service.WeibotagService;
import service.WeiboService;

public class AddPersonalWeiboAction extends BaseAction{
	private static final long serialVersionUID = 1L;

	private String content;
	private String tags;
	
	private WeiboService weiboService;
	private WeibotagService weibotagService;
	
	public String getContent(){
		return content;
	}
	
	public void setContent(String content){
		this.content = content;
	}
	
	public void setWeiboService(WeiboService weiboService){
		this.weiboService = weiboService;
	}
	
	public void setWeibotagService(WeibotagService weibotagService){
		this.weibotagService = weibotagService;
	}
	
	@Override
	public String execute() throws Exception {
		String username = ((User) session.get("user")).getUsername();
		String[] singleTagid = tags.split("\\,");
		List<Integer> tagids = new ArrayList<Integer>();
		for(String s : singleTagid){
			tagids.add(Integer.valueOf(s));				
		}
		java.sql.Timestamp time = new java.sql.Timestamp(new java.util.Date().getTime());
		Weibo weibo = new Weibo(username, content, time);
		weiboService.addWeibo(weibo);
		for(Integer t : tagids){
			Weibotag weibotag = new Weibotag(t.intValue(), weibo.getWeiboid());
			weibotagService.addWeibotag(weibotag);
		}
		return SUCCESS;
	}
	
}