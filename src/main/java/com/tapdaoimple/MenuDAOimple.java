package com.tapdaoimple;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tap.dao.MenuDAO;
import com.tap.model.Menu;
import com.tap.util.DbConnection;

public class MenuDAOimple implements MenuDAO {

	private static final String INSERT_MENU =
			"INSERT INTO menu(menu_id,description,price,rating,image_url,type,is_available,restaurant_id) VALUES(?,?,?,?,?,?,?,?)";

	private static final String GET_MENU_BY_ID =
			"SELECT * FROM menu WHERE menu_id=?";

	private static final String UPDATE_MENU =
			"UPDATE menu SET description=?, price=?, rating=?, image_url=?, type=?, is_available=?, restaurant_id=? WHERE menu_id=?";

	private static final String DELETE_MENU =
			"DELETE FROM menu WHERE menu_id=?";

	private static final String GET_ALL_MENU =
			"SELECT * FROM menu";
	
	private static final String GET_MENU_BY_RESTAURANT =
	        "SELECT * FROM menu WHERE restaurant_id=?";
	
	private static final String SEARCH_MENU =
			"SELECT * FROM menu WHERE description LIKE ? OR type LIKE ?";


	@Override
	public List<Menu> getAllMenuItems() {

	    List<Menu> menuList = new ArrayList<>();

	    String sql = "SELECT * FROM menu ORDER BY type, menu_id";

	    try (Connection con = DbConnection.getConnection();
	         PreparedStatement pstmt = con.prepareStatement(sql);
	         ResultSet rs = pstmt.executeQuery()) {

	        while (rs.next()) {

	            Menu menu = new Menu();

	            menu.setMenuId(rs.getInt("menu_id"));
	            menu.setDescription(rs.getString("description"));
	            menu.setPrice(rs.getDouble("price"));
	            menu.setRating(rs.getDouble("rating"));
	            menu.setImageUrl(rs.getString("image_url"));
	            menu.setType(rs.getString("type"));
	            menu.setAvailable(rs.getBoolean("is_available"));
	            menu.setRestaurantId(rs.getInt("restaurant_id"));

	            menuList.add(menu);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return menuList;
	}
	
	@Override
	public List<Menu> getTopRatedMenus() {

	    List<Menu> list = new ArrayList<>();

	    String sql = "SELECT * FROM menu ORDER BY rating DESC LIMIT 3";

	    try (Connection con = DbConnection.getConnection();
	         PreparedStatement pstmt = con.prepareStatement(sql);
	         ResultSet rs = pstmt.executeQuery()) {

	        while (rs.next()) {

	            Menu menu = new Menu();

	            menu.setMenuId(rs.getInt("menu_id"));
	            menu.setDescription(rs.getString("description"));
	            menu.setPrice(rs.getDouble("price"));
	            menu.setRating(rs.getDouble("rating"));
	            menu.setImageUrl(rs.getString("image_url"));
	            menu.setType(rs.getString("type"));
	            menu.setAvailable(rs.getBoolean("is_available"));
	            menu.setRestaurantId(rs.getInt("restaurant_id"));

	            list.add(menu);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}
	
	@Override
	public int addMenu(Menu menu) {

		int res = 0;

		try(Connection connection = DbConnection.getConnection();
			PreparedStatement pstmt = connection.prepareStatement(INSERT_MENU)) {

			pstmt.setInt(1, menu.getMenuId());
			pstmt.setString(2, menu.getDescription());
			pstmt.setDouble(3, menu.getPrice());
			pstmt.setDouble(4, menu.getRating());
			pstmt.setString(5, menu.getImageUrl());
			pstmt.setString(6, menu.getType());
			pstmt.setBoolean(7, menu.isAvailable());
			pstmt.setInt(8, menu.getRestaurantId());

			res = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return res;
	}


	@Override
	public Menu getMenu(int menuId) {

		Menu menu = null;

		try(Connection connection = DbConnection.getConnection();
			PreparedStatement pstmt = connection.prepareStatement(GET_MENU_BY_ID)) {

			pstmt.setInt(1, menuId);

			ResultSet res = pstmt.executeQuery();

			while(res.next()) {

				int id = res.getInt("menu_id");
				String description = res.getString("description");
				double price = res.getDouble("price");
				double rating = res.getDouble("rating");
				String imageUrl = res.getString("image_url");
				String type = res.getString("type");
				boolean isAvailable = res.getBoolean("is_available");
				int restaurantId = res.getInt("restaurant_id");

				menu = new Menu(id, description, price, rating, imageUrl, type, isAvailable, restaurantId);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return menu;
	}


	@Override
	public void updateMenu(Menu menu) {

		try(Connection connection = DbConnection.getConnection();
			PreparedStatement pstmt = connection.prepareStatement(UPDATE_MENU)) {

			pstmt.setString(1, menu.getDescription());
			pstmt.setDouble(2, menu.getPrice());
			pstmt.setDouble(3, menu.getRating());
			pstmt.setString(4, menu.getImageUrl());
			pstmt.setString(5, menu.getType());
			pstmt.setBoolean(6, menu.isAvailable());
			pstmt.setInt(7, menu.getRestaurantId());
			pstmt.setInt(8, menu.getMenuId());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	@Override
	public void deleteMenu(int menuId) {

		try(Connection connection = DbConnection.getConnection();
			PreparedStatement pstmt = connection.prepareStatement(DELETE_MENU)) {

			pstmt.setInt(1, menuId);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public List<Menu> getMenuByRestaurantId(int restaurantId) {

	    List<Menu> list = new ArrayList<>();

	    try (Connection connection = DbConnection.getConnection();
	         PreparedStatement pstmt =
	                 connection.prepareStatement(GET_MENU_BY_RESTAURANT)) {

	        pstmt.setInt(1, restaurantId);

	        ResultSet res = pstmt.executeQuery();

	        while (res.next()) {

	            Menu menu = new Menu(
	                    res.getInt("menu_id"),
	                    res.getString("description"),
	                    res.getDouble("price"),
	                    res.getDouble("rating"),
	                    res.getString("image_url"),
	                    res.getString("type"),
	                    res.getBoolean("is_available"),
	                    res.getInt("restaurant_id")
	            );

	            list.add(menu);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}
	
	@Override
	public List<Menu> searchMenu(String keyword) {

	    List<Menu> list = new ArrayList<>();

	    try (Connection connection = DbConnection.getConnection();
	         PreparedStatement pstmt =
	                 connection.prepareStatement(SEARCH_MENU)) {

	        pstmt.setString(1, "%" + keyword + "%");
	        pstmt.setString(2, "%" + keyword + "%");

	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {

	            Menu menu = new Menu(
	                    rs.getInt("menu_id"),
	                    rs.getString("description"),
	                    rs.getDouble("price"),
	                    rs.getDouble("rating"),
	                    rs.getString("image_url"),
	                    rs.getString("type"),
	                    rs.getBoolean("is_available"),
	                    rs.getInt("restaurant_id")
	            );

	            list.add(menu);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}


	@Override
	public List<Menu> getAllMenus() {

		List<Menu> list = new ArrayList<>();

		try(Connection connection = DbConnection.getConnection();
			PreparedStatement pstmt = connection.prepareStatement(GET_ALL_MENU)) {

			ResultSet res = pstmt.executeQuery();

			while(res.next()) {

				int id = res.getInt("menu_id");
				String description = res.getString("description");
				double price = res.getDouble("price");
				double rating = res.getDouble("rating");
				String imageUrl = res.getString("image_url");
				String type = res.getString("type");
				boolean isAvailable = res.getBoolean("is_available");
				int restaurantId = res.getInt("restaurant_id");

				Menu menu = new Menu(id, description, price, rating, imageUrl, type, isAvailable, restaurantId);

				list.add(menu);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

}