package action;

import model.Tag;
import model.Usertag;
import service.UsertagService;

public class AddUsertagAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	private int tagid;
	private int userid;
	
	private UsertagService usertagService;
	
	public int getTagid(){
		return tagid;
	}
	
	public void setTagid(int tagid){
		this.tagid = tagid;
	}
	
	public int getUserid(){
		return userid;
	}
	
	public void setUserid(int userid){
		this.userid = userid;
	}

	public void setUsertagService(UsertagService usertagService){
		this.usertagService = usertagService;
	}
	
	@Override
	public String execute() throws Exception{
		Usertag usertag = new Usertag(tagid, userid);
		usertagService.addUsertag(usertag);
		return SUCCESS;
	}
	
}