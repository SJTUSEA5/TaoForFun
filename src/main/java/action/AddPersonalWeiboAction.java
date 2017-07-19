package action;

import model.User;
import model.Weibo;
import service.WeiboService;

public class AddPersonalWeiboAction extends BaseAction{
	private static final long serialVersionUID = 1L;

	private String content;
	
	private WeiboService weiboService;
	
	public String getContent(){
		return content;
	}
	
	public void setContent(String content){
		this.content = content;
	}
	
	public void setWeiboService(WeiboService weiboService){
		this.weiboService = weiboService;
	}
	
	@Override
	public String execute() throws Exception {
		String username = ((User) session.get("user")).getUsername();
		java.sql.Timestamp time = new java.sql.Timestamp(new java.util.Date().getTime());
		Weibo weibo = new Weibo(username, content, time);
		weiboService.addWeibo(weibo);
		return SUCCESS;
	}
	
}