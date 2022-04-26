package com.skilldistillery.petsleuth.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.petsleuth.entities.Contact;
import com.skilldistillery.petsleuth.entities.Location;
import com.skilldistillery.petsleuth.entities.Pet;
import com.skilldistillery.petsleuth.entities.Post;
import com.skilldistillery.petsleuth.entities.User;

@Service
@Transactional
public class UserDaoImpl implements UserDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public User findById(int userId) {
		return em.find(User.class, userId);
	}

	@Override
	public User createNewUser(User user) {
		User newUser = user;
		em.persist(newUser);
		return newUser;
	}
	@Override
	public User findExistingUser(String userName, String password) {
		String sql = "SELECT user FROM User user WHERE user.username = :userName AND user.password = :password ";
		User user = em.createQuery(sql, User.class).setParameter("userName", userName).setParameter("password", password).getSingleResult();
		return user;
		
	}

	@Override
	public Post addPost(Post post, int petId, int contactId, int locationId) {
		post.setPet(findPetById(petId));
		post.setContact(findContactById(contactId));
		post.setLocation(findLocationById(locationId));
		post.setActive(true);
		em.persist(post);
		em.flush();
		
		return post;
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
		
	
}
