package com.skilldistillery.petsleuth.data;

import java.util.List;

import com.skilldistillery.petsleuth.entities.PostComment;

public interface PostCommentDAO {

	PostComment createNewComment(int postId, int userId, String content, Integer inReplyToCommentId);
	
	List<PostComment> findPostCommentByPostId(int postId);
	
}
