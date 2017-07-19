package action;

import model.Usertag;
import service.UsertagService;

public class DeleteUsertagAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	private int tagid;
	
	private UsertagService usertagService;
	
	public int getTagid(){
		return tagid;
	}
	
	public void setTagid(int tagid){
		this.tagid = tagid;
	}
	
	public void setUsertagService(UsertagService usertagService){
		this.usertagService = usertagService;
	}
	
	@Override
	public String execute() throws Exception{
		Usertag usertag = usertagService.getUsertagByTagid(tagid);
		usertagService.deleteUsertag(usertag);
		return SUCCESS;
	}
	
}
