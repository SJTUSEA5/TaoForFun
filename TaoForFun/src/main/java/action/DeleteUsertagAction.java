package action;

import model.Usertag;
import service.UsertagService;
import java.util.List;

public class DeleteUsertagAction extends BaseAction{

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
		List<Usertag> usertags = usertagService.getUsertagByTagid(tagid);
		Usertag usertag = new Usertag();
		for(Usertag ut : usertags) {
			if(ut.getUserid() == userid) {
				usertag = ut;
				break;
			}
		}
		usertagService.deleteUsertag(usertag);
		return SUCCESS;
	}
	
}