package com.skilldistillery.petsleuth.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.petsleuth.entities.Contact;
import com.skilldistillery.petsleuth.entities.Location;
import com.skilldistillery.petsleuth.entities.Pet;
import com.skilldistillery.petsleuth.entities.PetPhoto;
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
		User user = null;
			try {
				user =	em.createQuery(sql, User.class).setParameter("userName", userName).setParameter("password", password).getSingleResult();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return user;
		
	}
	
	public User updateUser(User newUser, User user) {
		User updateUser = em.find(User.class, user.getId());
		updateUser.setFirstName(newUser.getFirstName());
		updateUser.setLastName(newUser.getLastName());
		updateUser.setBiography(newUser.getBiography());
		updateUser.setPhotoURL(newUser.getPhotoURL());
		updateUser.setActive(newUser.getActive());
		em.persist(updateUser);
		return updateUser;
		
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
	
	@Override
	public Pet addPet(Pet pet) {
		
		pet.setActive(true);
		em.persist(pet);
		em.flush();
		
		return pet;
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

	@Override
	public List<Location> findLocationsByUserId(int id) {
		String sql = "SELECT location FROM Location location WHERE location.user.id = :id";
		List<Location> locations = em.createQuery(sql, Location.class).setParameter("id", id).getResultList();
		return locations;
	}

	@Override
	public List<Contact> findContactsByUserId(int id) {
		String sql = "SELECT contact FROM Contact contact WHERE contact.user.id = :id";
		List<Contact> contacts = em.createQuery(sql, Contact.class).setParameter("id", id).getResultList();
		return contacts;
	}

	@Override
	public List<Pet> findPetsByUserId(int id) {
		String sql = "SELECT pet FROM Pet pet WHERE pet.user.id = :id";
		List<Pet> pets = em.createQuery(sql, Pet.class).setParameter("id", id).getResultList();
		return pets;
	}

	@Override
	public PetPhoto findPetPhotoById(int petPhotoId) {
		return em.find(PetPhoto.class, petPhotoId);
		
	}
		
}
