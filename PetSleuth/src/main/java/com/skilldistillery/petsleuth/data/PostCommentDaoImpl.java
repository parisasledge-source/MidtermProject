package com.skilldistillery.petsleuth.data;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.petsleuth.entities.Contact;
import com.skilldistillery.petsleuth.entities.PostComment;

@Service
@Transactional
public class PostCommentDaoImpl implements PostCommentDAO {
	
	@Autowired
	private UserDAO userDao;
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public PostComment createNewComment(int postId, int userId, String content, Integer inReplyToCommentId) {
		
		PostComment pc = new PostComment();
		
		pc.setPost(userDao.findPostById(postId));
		pc.setUser(userDao.findById(userId));
		pc.setContent(content);
		pc.setCommentDate(LocalDateTime.now());
		pc.setInReplyToCommentId(findPostCommentById(inReplyToCommentId));
		
		em.persist(pc);
		em.flush();
		
//		if (em.find(PostComment.class, pc.getId()) != null) {
//			return true;
//		}
		
		return pc;
	}
	
	public PostComment findPostCommentById(Integer inReplyToCommentId) {
		return em.find(PostComment.class, inReplyToCommentId);
	}
	
	public List<PostComment> findPostCommentByPostId(int postId) {
		String sql = "SELECT pc FROM PostComment pc WHERE pc.post.id = :id";
		List<PostComment> comments = em.createQuery(sql, PostComment.class).setParameter("id", postId).getResultList();
		return comments;
	}

}
