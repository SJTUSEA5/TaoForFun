package action;

import java.io.File;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import model.User;
import service.UserService;

public class UpdateHeadimgAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	private File headimg;
	private String headimgFileName; 
	private String headimgContentType;
	
	private UserService userService;
	
	public File getHeadimg(){
		return headimg;
	}
	
	public void setHeadimg(File headimg){
		this.headimg = headimg;
	}
	
	public String getHeadimgFileName(){
		return headimgFileName;
	}
	
	public void setHeadimgFileName(String headimgFileName){
		this.headimgFileName = headimgFileName;
	}
	
	public String getHeadimgContentType(){
		return headimgContentType;
	}
	
	public void setHeadimgContentType(String headimgContentType){
		this.headimgContentType = headimgContentType;
	}
	
	
	public void setUserService(UserService userService){
		this.userService = userService;
	}
	
	public String execute() throws Exception{
		System.out.println(headimg);
		System.out.println(headimgFileName);
		User user = (User) session.get("user");
		System.out.println(user);
		if(headimg != null){
			String filePath=ServletActionContext.getServletContext().getRealPath("/taoforfun/img/UserHeadImg"); 
			String filename = user.getUsername() + headimgFileName.substring(headimgFileName.lastIndexOf("."));
			FileUtils.copyFile(headimg, new File(filePath, filename));
			if(user.getHeadimg() != null){
				user.setHeadimg(null);
				String oldfilename = filePath +"\\" + user.getHeadimg();
				File file = new File(oldfilename);
				file.delete();
			}
			user.setHeadimg(filename);
		}
		userService.updateUser(user);
		return SUCCESS;
	}
	
}
