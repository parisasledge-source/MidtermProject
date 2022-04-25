package com.skilldistillery.petsleuth.data;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.petsleuth.entities.Post;

@Service
@Transactional
public class PostDaoImpl implements PostDAO {
	
	@PersistenceContext
	private EntityManager em;


	@Override
	public List<Post> findByUserId(int userId) {
		
		String sql = "SELECT post FROM Post post WHERE post.user.id = :userId";
		List<Post> posts = em.createQuery(sql, Post.class).setParameter("userId", userId).getResultList();
		return posts;
	}


	@Override
	public boolean destroy(Integer id) {
		boolean removePost = false;
		Post deletedPost = em.find(Post.class, id);
		if (deletedPost != null) {
			em.remove(deletedPost);
			removePost = !em.contains(deletedPost);
		}
		return removePost;
	}

	@Override
	public Post updatePost(int postId, Post post) {
		
		Post updatePost = em.find(Post.class, postId);
		
		updatePost.setPostingDate(LocalDateTime.now());
		updatePost.setLastSeen(post.getLastSeen());
		updatePost.setDescription(post.getDescription());
		updatePost.setReward(post.getReward());
		
		return updatePost;
		
	}

}
