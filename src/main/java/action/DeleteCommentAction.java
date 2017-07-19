package action;

import model.Comment;
import service.CommentService;

public class DeleteCommentAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	private int commentid;
	private CommentService commentService;
	
	public int getCommentid(){
		return commentid;
	}
	
	public void setCommentid(int commentid){
		this.commentid = commentid;
	}
	
	public void setCommentService(CommentService commentService){
		this.commentService = commentService;
	}
	
	@Override
	public String execute() throws Exception{
		
		Comment comment = commentService.getCommentByCommentid(commentid);
		commentService.deleteComment(comment);
		return SUCCESS;
	}
	
}