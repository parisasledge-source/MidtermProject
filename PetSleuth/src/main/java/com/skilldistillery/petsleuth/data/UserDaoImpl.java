package com.skilldistillery.petsleuth.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.petsleuth.entities.User;

@Service
@Transactional
public class UserDaoImpl implements UserDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public User findById(int userId) {
		return em.find(User.class, userId);
	}

	@Override
	public User createNewUser(User user) {
		User newUser = user;
		em.persist(newUser);
		return newUser;
	}
	@Override
	public User findExistingUser(String userName, String password) {
		String sql = "SELECT user FROM User user WHERE user.username = :userName AND user.password = :password ";
		User user = em.createQuery(sql, User.class).setParameter("userName", userName).setParameter("password", password).getSingleResult();
		return user;
		
	}
		
	
}
