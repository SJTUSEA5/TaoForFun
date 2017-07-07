package service.impl;

import java.util.List;

import model.Comment;
import service.CommentService;
import dao.CommentDao;

public class CommentServiceImpl implements CommentService{
	
	private CommentDao commentDao;
	
	public void setCommentDao(CommentDao commentDao){
		this.commentDao = commentDao;
	}
	
	public boolean addComment(Comment comment){
		Integer ref=(Integer) commentDao.save(comment);
		if(ref!=null)  
            return true;  
        else  
            return false; 
	}
	
	public void deleteComment(Comment comment){
		commentDao.delete(comment);
	}
	
	public List<Comment> getCommentByWeiboid(int weiboid){
		return commentDao.getCommentByWeiboid(weiboid);
	}

}
