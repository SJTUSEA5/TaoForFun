package action;

import model.Comment;
import model.User;
import service.CommentService;

public class AddCommentAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;

	private int weiboid;
	private String content;
	
	private CommentService commentService;
	
	public int getWeiboid(){
		return weiboid;
	}
	
	public void setWeiboid(int weiboid){
		this.weiboid = weiboid;
	}
	
	public String getContent(){
		return content;
	}
	
	public void setContent(String content){
		this.content = content;
	}
	
	public void setCommentService(CommentService commentService){
		this.commentService = commentService;
	}
	
	@Override
	public String execute() throws Exception {
		String username = ((User) session.get("user")).getUsername();
		java.sql.Timestamp time = new java.sql.Timestamp(new java.util.Date().getTime());
		Comment comment = new Comment(weiboid, username, content, time);
		if(commentService.addComment(comment))
			return "success";
		else
			return "input";
		
	}
	
}