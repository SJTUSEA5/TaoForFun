package service;

import java.util.List;

import model.Comment;

public interface CommentService {

	public boolean addComment(Comment comment);
	
	public void deleteComment(Comment comment);
	
	public List<Comment> getCommentByWeiboid(int weiboid);
	
	public Comment getCommentByCommentid(int commentid);
	
}
