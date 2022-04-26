package com.skilldistillery.petsleuth.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.petsleuth.entities.Post;

@Service
@Transactional
public class SearchDaoImpl implements SearchDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Post> findById(int id) {
		String sql = "SELECT post FROM Post post WHERE post.id = :id";
		List<Post> posts = em.createQuery(sql, Post.class).setParameter("id", id).getResultList();
		return posts;
	}

	@Override
	public List<Post> findByLocation(String word) {
		String sql = "SELECT post FROM Post post WHERE post.location.city = :word OR post.location.state = :word2 OR post.location.street = :word3";
		List<Post> posts = em.createQuery(sql, Post.class).setParameter("word", word).setParameter("word2", word)
				.setParameter("word3", word).getResultList();
		return posts;
	}

	@Override
	public List<Post> findByPost(String word) {
		String sql = "SELECT post FROM Post post WHERE post.description LIKE :word";
		List<Post> posts = em.createQuery(sql, Post.class).setParameter("word", "%" + word + "%").getResultList();
		return posts;
	}

	@Override
	public List<Post> findByPet(String word) {
		String sql = "SELECT post FROM Post post WHERE post.pet.species = :word OR post.pet.breed = :word2 OR post.pet.description LIKE :word3 OR post.pet.color = :word4";
		List<Post> posts = em.createQuery(sql, Post.class).setParameter("word", word).setParameter("word2", word)
				.setParameter("word3", "%" + word + "%").setParameter("word4", word).getResultList();
		return posts;
	}

	@Override
	public List<Post> displayAllPosts() {
		String sql = "SELECT post FROM Post post";
		List<Post> posts = em.createQuery(sql, Post.class).getResultList();
		return posts;
	}

}
