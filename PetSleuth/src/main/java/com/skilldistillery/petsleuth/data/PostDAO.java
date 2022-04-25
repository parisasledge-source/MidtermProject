package com.skilldistillery.petsleuth.data;

import java.util.List;

import com.skilldistillery.petsleuth.entities.Post;

public interface PostDAO {
	
	List<Post> findByUserId(int userId);
	public boolean destroy(Integer id);

}
