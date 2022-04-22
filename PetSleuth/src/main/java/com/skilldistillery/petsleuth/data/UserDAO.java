package com.skilldistillery.petsleuth.data;

import com.skilldistillery.petsleuth.entities.User;

public interface UserDAO {

	User findById(int userId);
	
	User createNewUser(User user);
		
}

