package com.skilldistillery.petsleuth.data;

import com.skilldistillery.petsleuth.entities.Contact;
import com.skilldistillery.petsleuth.entities.Location;
import com.skilldistillery.petsleuth.entities.Pet;
import com.skilldistillery.petsleuth.entities.Post;
import com.skilldistillery.petsleuth.entities.User;

public interface UserDAO {

	User findById(int userId);
	
	User createNewUser(User user);
	
	public User findExistingUser(String userName, String password);
	
	Post addPost(Post post, int petId, int contactId, int locationId);
	
	Location findLocationById(int petId);
	
	Contact findContactById(int petId);
	
	Pet findPetById(int petId);

	Post findPostById(int id);

	Pet addPet(Pet pet);

}

