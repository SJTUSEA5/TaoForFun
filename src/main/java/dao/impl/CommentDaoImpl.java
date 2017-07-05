package dao.impl;

import java.util.List;

import model.Comment;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import dao.CommentDao;

public class CommentDaoImpl extends HibernateDaoSupport implements CommentDao{
	
	public Integer save(Comment comment){
		return (Integer) getHibernateTemplate().save(comment);
	}

	public void delete(Comment comment){
		getHibernateTemplate().delete(comment);		
	}
	
	public List<Comment> getCommentByWeiboid(int weiboid){
		@SuppressWarnings("unchecked")
		List<Comment> comments = (List<Comment>) getHibernateTemplate().find(
				"from Comment as c where c.weiboid=?", weiboid);
		return comments;
	}
}
