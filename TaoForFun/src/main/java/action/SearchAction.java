package action;

import java.util.List;
import java.util.ArrayList;
import java.util.Collections;

import model.User;
import model.Weibo;
import service.UserService;
import service.WeiboService;

public class SearchAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	
	private String words;
	private UserService userService;
	private WeiboService weiboService;
	
	public String getWords(){
		return this.words;
	}
	
	public void setWords(String words){
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
		String[] singleWords = words.split("\\s+");
		List<String> words = new ArrayList<String>();
		for(String s : singleWords){
			words.add(s);				
		}
		List<User> userResult = new ArrayList<User>();
		List<Weibo> weiboResult = new ArrayList<Weibo>();
		for(int i=0;i < words.size();i++){
			List<User> userResult0 =  userService.getUserByWord(words.get(i));
			List<Weibo> weiboResult0 =  weiboService.getWeiboByWord(words.get(i));
			for(User u : userResult0){
				userResult.add(u);
			}
			Collections.reverse(weiboResult0);
			for(Weibo w : weiboResult0){
				weiboResult.add(w);
			}
		}
		request().setAttribute("userResult", userResult);
		request().setAttribute("weiboResult", weiboResult);
		return SUCCESS;
	}
}