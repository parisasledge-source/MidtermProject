package com.skilldistillery.petsleuth.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "post_comment")
public class PostComment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String content;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	@ManyToOne
	@JoinColumn(name = "post_id")
	private Post post;
	
	@Column(name = "comment_date")
	private LocalDateTime commentDate;
	
	@Column(name = "in_reply_to_id")
	private int inReplyToCommentId;
	
	//Default Constructor
	public PostComment() {}

	//Getters and Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public LocalDateTime getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(LocalDateTime commentDate) {
		this.commentDate = commentDate;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public int getInReplyToCommentId() {
		return inReplyToCommentId;
	}

	public void setInReplyToCommenId(int inReplyToCommentId) {
		this.inReplyToCommentId = inReplyToCommentId;
	}

	//hashcode and equals
	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PostComment other = (PostComment) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "PostComment [id=" + id + ", content=" + content + ", user=" + user + ", post=" + post + ", commentDate="
				+ commentDate + ", inReplyToCommentId=" + inReplyToCommentId + "]";
	}
	
	
	

}
