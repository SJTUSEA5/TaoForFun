package dao;

import java.util.List;

import model.Comment;

public interface CommentDao {
	
	public Integer save(Comment comment);

	public void delete(Comment comment);
	
	public List<Comment> getCommentByWeiboid(int weiboid);
	
	public Comment getCommentByCommentid(int commentid);

}
