package action;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import model.User;
import model.Weibo;
import model.Usertag;
import service.WeiboService;
import service.TagService;
import service.UsertagService;
import service.WeibotagService;

public class RecommendWeiboByTagsAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;
	
	private TagService tagService;
	private UsertagService usertagService;
	private WeibotagService weibotagService;
	private WeiboService weiboService;
	
	public void setTagService(TagService tagService){
		this.tagService = tagService;
	}
	
	public void setUsertagService(UsertagService usertagService){
		this.usertagService = usertagService;
	}
	
	public void setWeibotagService(WeibotagService weibotagService){
		this.weibotagService = weibotagService;
	}
	
	public void setWeiboService(WeiboService weiboService){
		this.weiboService = weiboService;
	}
	
	
	
	
	@Override
	public String execute() throws Exception{
		int userid = ((User) session.get("user")).getUserid();
		List<Usertag> usertags = usertagService.getUsertagByUserid(userid);
		List<Weibo> recommendedWeibos = new ArrayList<Weibo>();
		for(Usertag usertag : usertags){
			int tagid = usertag.getTagid();
			List<Integer> weiboids = weibotagService.getWeiboidByTagid(tagid);
			Set<Integer> tmp = new HashSet<Integer>(weiboids);
		    weiboids.clear();
		    weiboids.addAll(tmp);
			for(Integer weiboid : weiboids){
				int wid = weiboid.intValue();
				Weibo weibo = weiboService.getWeiboByWeiboid(wid);
				recommendedWeibos.add(weibo);
			}
		}
		request().setAttribute("recommendedWeibos", recommendedWeibos);
		return SUCCESS;
	}
	
}