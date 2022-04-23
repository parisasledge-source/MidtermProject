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

@Entity
public class Post {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "posting_date")
	private LocalDateTime postingDate;
	@Column(name = "last_seen")
	private LocalDateTime lastSeen;
	private String description;
	private boolean active;
	private String reward;
	@Column(name ="date_found")
	private LocalDateTime dateFound;
	private Integer rating;
	@Column(name = "rating_comment")
	private String ratingComment;
	
	@ManyToOne
	@JoinColumn(name= "contact_id")
	private Contact contact;
	
	//methods
	
	public Post() {}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public LocalDateTime getPostingDate() {
		return postingDate;
	}
	public void setPostingDate(LocalDateTime postingDate) {
		this.postingDate = postingDate;
	}
	public LocalDateTime getLastSeen() {
		return lastSeen;
	}
	public void setLastSeen(LocalDateTime lastSeen) {
		this.lastSeen = lastSeen;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}
	public String getReward() {
		return reward;
	}
	public void setReward(String reward) {
		this.reward = reward;
	}
	public LocalDateTime getDateFound() {
		return dateFound;
	}
	public void setDateFound(LocalDateTime dateFound) {
		this.dateFound = dateFound;
	}
	public Integer getRating() {
		return rating;
	}
	public void setRating(Integer rating) {
		this.rating = rating;
	}
	public String getRatingComment() {
		return ratingComment;
	}
	public void setRatingComment(String ratingComment) {
		this.ratingComment = ratingComment;
	}

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
		Post other = (Post) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Post [id=" + id + ", postingDate=" + postingDate + ", lastSeen=" + lastSeen + ", description="
				+ description + ", active=" + active + ", reward=" + reward + ", dateFound=" + dateFound + ", rating="
				+ rating + ", ratingComment=" + ratingComment + "]";
	}
	
	
	
	
}
