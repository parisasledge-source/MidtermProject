package com.skilldistillery.petsleuth.data;

import java.util.List;

import com.skilldistillery.petsleuth.entities.Contact;
import com.skilldistillery.petsleuth.entities.Location;
import com.skilldistillery.petsleuth.entities.Pet;
import com.skilldistillery.petsleuth.entities.Post;
import com.skilldistillery.petsleuth.entities.User;

public interface UserDAO {

	User findById(int userId);
	
	User createNewUser(User user);
	
	public User findExistingUser(String userName, String password);
	
	public User updateUser(User newUser, User user);
	
	Post addPost(Post post, int petId, int contactId, int locationId);
	
	Location findLocationById(int petId);
	
	Contact findContactById(int petId);
	
	Pet findPetById(int petId);

	Post findPostById(int id);
	
	List<Location> findLocationsByUserId(int id);
	
	List<Contact> findContactsByUserId(int id);
	
	List<Pet> findPetsByUserId(int id);

	Pet addPet(Pet pet);

}

