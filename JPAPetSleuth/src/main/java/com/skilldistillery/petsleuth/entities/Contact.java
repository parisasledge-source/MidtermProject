package com.skilldistillery.petsleuth.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

//	desc contact;
//	+--------------------+--------------+------+-----+---------+-------+
//	| Field              | Type         | Null | Key | Default | Extra |
//	+--------------------+--------------+------+-----+---------+-------+
//	| id                 | int(11)      | NO   | PRI | NULL    |       |
//	| contact_preference | varchar(45)  | NO   |     | NULL    |       |
//	| email              | varchar(45)  | YES  |     | NULL    |       |
//	| phone_number       | varchar(45)  | YES  |     | NULL    |       |
//	| user_id            | int(11)      | NO   | MUL | NULL    |       |
//	| contact_info       | varchar(200) | YES  |     | NULL    |       |
//	+--------------------+--------------+------+-----+---------+-------+

@Entity
public class Contact {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "contact_preference")
	private String contacPreference;
	
	private String email;
	
	@Column(name = "phone_number")
	private String photoNumber;
	
	@Column(name = "contact_info")
	private String contactInfo;
	
	@ManyToOne
	@JoinColumn(name= "user_id")
	private User user;
	
	@OneToMany(mappedBy = "contact")
	private List<Post> posts;
	
	//method

	public Contact() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContacPreference() {
		return contacPreference;
	}

	public void setContacPreference(String contacPreference) {
		this.contacPreference = contacPreference;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhotoNumber() {
		return photoNumber;
	}

	public void setPhotoNumber(String photoNumber) {
		this.photoNumber = photoNumber;
	}

	public String getContactInfo() {
		return contactInfo;
	}
	
	public void setContactInfo(String contactInfo) {
		this.contactInfo = contactInfo;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Post> getPosts() {
		return posts;
	}

	public void setPosts(List<Post> posts) {
		this.posts = posts;
	}


	@Override
	public String toString() {
		return "Contact [id=" + id + ", contacPreference=" + contacPreference + ", email=" + email + ", photoNumber="
				+ photoNumber + ", contactInfo=" + contactInfo + "]";
	}
	

}
