package com.tapdaoimple;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tap.dao.RestaurantDAO;
import com.tap.model.Restaurant;
import com.tap.util.DbConnection;

public class RestaurantDAOimple implements RestaurantDAO {

	private static final String INSERT_RESTAURANT =
			"INSERT INTO restaurant VALUES(?,?,?,?,?,?,?,?,?)";

	private static final String GET_RESTAURANT =
			"SELECT * FROM restaurant WHERE restaurant_id=?";

	private static final String UPDATE_RESTAURANT =
			"UPDATE restaurant SET name=?, address=?, cuisine_type=?, rating=?, eta=?, image_url=?, isavailable=? WHERE restaurant_id=?";

	private static final String DELETE_RESTAURANT =
			"DELETE FROM restaurant WHERE restaurant_id=?";

	private static final String GET_ALL_RESTAURANTS =
			"SELECT * FROM restaurant";

	@Override
	public int addRestaurant(Restaurant r) {

		int res = 0;

		try(Connection connection = DbConnection.getConnection();
			PreparedStatement pstmt = connection.prepareStatement(INSERT_RESTAURANT)) {

			pstmt.setInt(1, r.getRestaurantId());
			pstmt.setString(2, r.getName());
			pstmt.setInt(3, r.getAdminId());
			pstmt.setString(4, r.getAddress());
			pstmt.setString(5, r.getCuisineType());
			pstmt.setDouble(6, r.getRating());
			pstmt.setInt(7, r.getEta());
			pstmt.setString(8, r.getImageUrl());
			pstmt.setBoolean(9, r.isAvailable());

			res = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public Restaurant getRestaurant(int restaurantId) {

		Restaurant r = null;

		try(Connection connection = DbConnection.getConnection();
			PreparedStatement pstmt = connection.prepareStatement(GET_RESTAURANT)) {

			pstmt.setInt(1, restaurantId);

			ResultSet res = pstmt.executeQuery();

			while(res.next()) {

				int id = res.getInt("restaurant_id");
				String name = res.getString("name");
				int adminId = res.getInt("admin_id");
				String address = res.getString("address");
				String cuisine = res.getString("cuisine_type");
				double rating = res.getDouble("rating");
				int eta = res.getInt("eta");
				String image = res.getString("image_url");
				boolean available = res.getBoolean("isavailable");

				r = new Restaurant(id, name, adminId, address, cuisine, rating, eta, image, available);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return r;
	}

	@Override
	public void updateRestaurant(Restaurant r) {

		try(Connection connection = DbConnection.getConnection();
			PreparedStatement pstmt = connection.prepareStatement(UPDATE_RESTAURANT)) {

			pstmt.setString(1, r.getName());
			pstmt.setString(2, r.getAddress());
			pstmt.setString(3, r.getCuisineType());
			pstmt.setDouble(4, r.getRating());
			pstmt.setInt(5, r.getEta());
			pstmt.setString(6, r.getImageUrl());
			pstmt.setBoolean(7, r.isAvailable());
			pstmt.setInt(8, r.getRestaurantId());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteRestaurant(int restaurantId) {

		try(Connection connection = DbConnection.getConnection();
			PreparedStatement pstmt = connection.prepareStatement(DELETE_RESTAURANT)) {

			pstmt.setInt(1, restaurantId);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Restaurant> getAllRestaurants() {

		List<Restaurant> list = new ArrayList<>();

		try(Connection connection = DbConnection.getConnection();
			PreparedStatement pstmt = connection.prepareStatement(GET_ALL_RESTAURANTS)) {

			ResultSet res = pstmt.executeQuery();

			while(res.next()) {

				int id = res.getInt("restaurant_id");
				String name = res.getString("name");
				int adminId = res.getInt("admin_id");
				String address = res.getString("address");
				String cuisine = res.getString("cuisine_type");
				double rating = res.getDouble("rating");
				int eta = res.getInt("eta");
				String image = res.getString("image_url");
				boolean available = res.getBoolean("isavailable");

				Restaurant r = new Restaurant(id, name, adminId, address, cuisine, rating, eta, image, available);

				list.add(r);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
}