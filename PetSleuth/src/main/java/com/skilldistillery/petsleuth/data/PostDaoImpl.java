package com.skilldistillery.petsleuth.data;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.petsleuth.entities.Contact;
import com.skilldistillery.petsleuth.entities.Location;
import com.skilldistillery.petsleuth.entities.Pet;
import com.skilldistillery.petsleuth.entities.Post;
import com.skilldistillery.petsleuth.entities.PostComment;

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
		Post deactivatedPost = em.find(Post.class, id);
		if (deactivatedPost.getActive()) {
			deactivatedPost.setActive(false);
		}
		return removePost;
	}

	@Override
	public Post updatePost(Integer postId, Post post, int petId, int contactId, int locationId) {

		Post updatePost = em.find(Post.class, postId);

		updatePost.setPostingDate(LocalDateTime.now());
		updatePost.setLastSeen(post.getLastSeen());
		updatePost.setDescription(post.getDescription());
		updatePost.setReward(post.getReward());
		updatePost.setLocation(post.getLocation());
		updatePost.setContact(post.getContact());
		updatePost.setPet(post.getPet());

		updatePost.setPet(findPetById(petId));
		updatePost.setContact(findContactById(contactId));
		updatePost.setLocation(findLocationById(locationId));
		updatePost.setPostComments(findPostCommentById(post.getId()));

		return updatePost;

	}

	public Pet findPetById(int petId) {

		return em.find(Pet.class, petId);
	}

	public Location findLocationById(int locationId) {

		return em.find(Location.class, locationId);
	}

	public Contact findContactById(int contactId) {

		return em.find(Contact.class, contactId);
	}

	public Post findPostById(int postId) {

		return em.find(Post.class, postId);
	}

	public List<PostComment> findPostCommentById(int postId) {
		String sql = "SELECT pc FROM PostComment pc WHERE pc.post.id = :id";
		List<PostComment> postc = em.createQuery(sql, PostComment.class).setParameter("id", postId).getResultList();
		
		return postc;
	}

}
