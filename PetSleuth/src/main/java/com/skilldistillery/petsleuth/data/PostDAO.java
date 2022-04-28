package com.skilldistillery.petsleuth.data;

import java.util.List;

import com.skilldistillery.petsleuth.entities.Contact;
import com.skilldistillery.petsleuth.entities.Location;
import com.skilldistillery.petsleuth.entities.Pet;
import com.skilldistillery.petsleuth.entities.Post;
import com.skilldistillery.petsleuth.entities.PostComment;

public interface PostDAO {
	
	List<Post> findByUserId(int userId);

	public boolean destroy(Integer id);

	Post updatePost(Integer postId, Post post, int petId, int contactId, int locationId);
	
	public Pet findPetById(int petId);
	
	public Location findLocationById(int locationId);

	public Contact findContactById(int contactId);

	public Post findPostById(int postId);
	
	public List<PostComment> findPostCommentById(int postcommentId);
	
}
