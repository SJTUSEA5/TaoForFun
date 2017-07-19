package action;

import model.User;
import model.Usertag;
import service.UsertagService;

public class AddUsertagAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	private String tag;
	
	private UsertagService usertagService;
	
	public String getTag(){
		return tag;
	}
	
	public void setTag(String tag){
		this.tag = tag;
	}
	
	public void setUsertagService(UsertagService usertagService){
		this.usertagService = usertagService;
	}
	
	@Override
	public String execute() throws Exception{
		int userid = ((User) session.get("user")).getUserid();
		Usertag usertag = new Usertag(userid, tag);
		usertagService.addUsertag(usertag);
		return SUCCESS;
	}
	
}
