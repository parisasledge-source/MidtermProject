package com.skilldistillery.petsleuth.data;

import java.time.LocalDateTime;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.petsleuth.entities.PostComment;

@Service
@Transactional
public class PostCommentDaoImpl implements PostCommentDAO {
	
	@Autowired
	private UserDAO userDao;
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public boolean createNewComment(int postId, int userId, String content, Integer inReplyToCommentId) {
		
		PostComment pc = new PostComment();
		
		pc.setPost(userDao.findPostById(postId));
		pc.setUser(userDao.findById(userId));
		pc.setContent(content);
		pc.setCommentDate(LocalDateTime.now());
		pc.setInReplyToCommentId(findPostCommentById(inReplyToCommentId));
		
		em.persist(pc);
		em.flush();
		
		if (em.find(PostComment.class, pc.getId()) != null) {
			return true;
		}
		
		return false;
	}
	
	public PostComment findPostCommentById(Integer inReplyToCommentId) {
		return em.find(PostComment.class, inReplyToCommentId);
	}

}
