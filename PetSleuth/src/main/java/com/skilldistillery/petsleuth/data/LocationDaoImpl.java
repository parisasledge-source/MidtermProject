package com.skilldistillery.petsleuth.data;





import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.petsleuth.entities.Location;
import com.skilldistillery.petsleuth.entities.User;



@Service
@Transactional
public class LocationDaoImpl implements LocationDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Location findLocationById(int locationId) {	
		Location location = null;
		String sql = "SELECT location FROM Location location WHERE location.user.id = :id";
		List<Location> resultset = em.createQuery(sql, Location.class).setParameter("id", locationId).getResultList();
		if(!resultset.isEmpty()) {
			location = resultset.get(0); 
		}
		return location;
		}

	@Override
	public Location createNewLocation(Location location ,int userId, User user) {
		Location newLocation = location;
		user = em.find(User.class, userId);
		newLocation.setUser(user);
		em.persist(newLocation);
		user.setLocation(newLocation);
		em.persist(user);
		return newLocation;
	}

	@Override
	public Location findExistingLocation(String city, String state) {
		String sql = "SELECT location FROM Location location WHERE location.city = :city AND location.state = :state ";
		Location location = em.createQuery(sql, Location.class).setParameter("city", city).setParameter("state", state).getSingleResult();
		return location;
	}
	
	@Override
	public Location updateLocation(int locationId, Location location) {
		
		Location updateLocation = em.find(Location.class, locationId);
		updateLocation.setState(location.getState());
		updateLocation.setCity(location.getCity());
		updateLocation.setStreet(location.getStreet());
		updateLocation.setZipcode(location.getZipcode());
		
		
		return updateLocation;
	}

	@Override
	public boolean deleteLocation(Integer id) {
		boolean removeLocation = false;
		Location deactivatedLocation = em.find(Location.class, id);
		if(deactivatedLocation.getActive()) {
			deactivatedLocation.setActive(false);
		}
		return removeLocation;
	}
	
	public User findUserById(int userId) {
		return em.find(User.class, userId);
	}
	
}
