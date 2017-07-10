package service;

import java.util.List;

import model.Comment;

public interface CommentService {

	public boolean addComment(Comment comment);
	
	public void deleteComment(Comment comment);
	
	public Comment getCommentByCommentid(int commentid);
	
	public List<Comment> getCommentByWeiboid(int weiboid);
	
}
