package com.skilldistillery.petsleuth.data;


public interface PostCommentDAO {

	boolean createNewComment(int postId, int userId, String content, Integer inReplyToCommentId);
	
}
