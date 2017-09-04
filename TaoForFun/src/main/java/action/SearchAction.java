package action;

import java.util.List;
import java.util.ArrayList;
import model.User;
import model.Weibo;
import service.UserService;
import service.WeiboService;

public class SearchAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	
	private List<String> words;
	private UserService userService;
	private WeiboService weiboService;
	
	public List<String> getWords(){
		return this.words;
	}
	
	public void setWords(List<String> words){
		this.words = words;
	}
	
	public void setUserService(UserService userService){
		this.userService = userService;
	}
	
	public void setWeiboService(WeiboService weiboService){
		this.weiboService = weiboService;
	}
	
	@Override
	public String execute() throws Exception {
		
		System.out.println(words.get(0));
		return SUCCESS;
	}
}
