package com.skilldistillery.petsleuth.data;

import java.util.List;

import com.skilldistillery.petsleuth.entities.Post;

public interface SearchDAO {
	
	List<Post> findById(int id);

	List<Post> findByLocation(String word);
	
	List<Post> findByPost(String word);
	
	List<Post> findByPet(String word);
	
	List<Post> displayAllPosts();
}
