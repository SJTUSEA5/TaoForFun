package action;

import java.util.List;
import java.util.Map;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;

import model.Thumbup;
import model.Tag;
import model.User;
import model.Weibo;
import service.ThumbupService;
import service.TagService;
import service.UserService;
import service.WeiboService;

public class SearchAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	
	private String words;
	private TagService tagService;
	private UserService userService;
	private WeiboService weiboService;

	private ThumbupService thumbupService;
	
	public String getWords(){
		return this.words;
	}
	
	public void setWords(String words){
		this.words = words;
	}
	
	public void setTagService(TagService tagService){
		this.tagService = tagService;
	}
	
	public void setUserService(UserService userService){
		this.userService = userService;
	}
	
	public void setWeiboService(WeiboService weiboService){
		this.weiboService = weiboService;
	}
	
	public void setThumbupService(ThumbupService thumbupService){
		this.thumbupService = thumbupService;
	}
	
	@Override
	public String execute() throws Exception {
		String username = ((User) session.get("user")).getUsername();
		String[] singleWords = words.split("\\s+");
		List<String> words = new ArrayList<String>();
		for(String s : singleWords){
			words.add(s);				
		}
		List<Tag> tagResult = new ArrayList<Tag>();
		List<User> userResult = new ArrayList<User>();
		List<Weibo> weiboResult = new ArrayList<Weibo>();
		for(int i=0;i < words.size();i++){
			List<Tag> tagResult0 =  tagService.getTagByTagname(words.get(i));
			List<User> userResult0 =  userService.getUserByWord(words.get(i));
			List<Weibo> weiboResult0 =  weiboService.getWeiboByWord(words.get(i));
			for(User u : userResult0){
				userResult.add(u);
			}
			Collections.reverse(weiboResult0);
			for(Weibo w : weiboResult0){
				weiboResult.add(w);
			}
			for(Tag t : tagResult0){
				tagResult.add(t);
			}
		}
		
		Map<Integer, Boolean> thumbupCheck = new HashMap<Integer, Boolean>();
		for(Weibo w : weiboResult){
			Thumbup thumbup = thumbupService.getThumbupByUsernameAndWeiboid(username, w.getWeiboid());
			if(thumbup!=null){
				thumbupCheck.put(w.getWeiboid(), true);
			}
			else{
				thumbupCheck.put(w.getWeiboid(), false);
			}
		}
		request().setAttribute("thumbupCheck", thumbupCheck);
		request().setAttribute("tagResult", tagResult);
		request().setAttribute("userResult", userResult);
		request().setAttribute("weiboResult", weiboResult);
		return SUCCESS;
	}
}