package com.tapdaoimple;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tap.dao.UserDAO;
import com.tap.model.User;
import com.tap.util.DbConnection;

public class UserDAOimple implements UserDAO {
	

	private static final String INSERT_USERS = "INSERT INTO users(username,password,email,address,phone_number,last_login_date,created_date,role)"
			+" values(?,?,?,?,?,?,?,?)";
	private static final String GET_USERS_BY_ID = "SELECT * FROM users WHERE user_id = ?";
	private static final String GET_USER_BY_EMAIL = "SELECT * FROM users WHERE email = ?";
	private static final String UPDATE_USERS = "UPDATE users SET username = ?, password =?, email = ?, address = ?,phone_number = ?"
	+" WHERE user_id = ?";
	private static final String DELETE_USER = "DELETE FROM users WHERE user_id = ?";
	private static final String GET_ALL_USERS = "SELECT * FROM users";

	@Override
	public int addUser(User user) 
	{
		int res=0;
		try(Connection connection=DbConnection.getConnection();
			PreparedStatement pstmt=connection.prepareStatement(INSERT_USERS);) 
		{
			
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getAddress());
			pstmt.setString(5, user.getPhoneNumber());
			pstmt.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
			pstmt.setTimestamp(7, new Timestamp(System.currentTimeMillis()));
			pstmt.setString(8, user.getRole());
			
			res=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public User getUser(int userId) {
		User user=null;
		
		try(Connection connection=DbConnection.getConnection();
			PreparedStatement pstmt= connection.prepareStatement(GET_USERS_BY_ID);) {
		
			pstmt.setInt(1, userId);
			ResultSet res=pstmt.executeQuery();
			while(res.next())
			{
				int userid=res.getInt("user_id");
				String username=res.getString("username");
				String password=res.getString("password");
				String email=res.getString("email");
				String address=res.getString("address");
				String phonenumber=res.getString("phone_number");
				String role=res.getString("role");
				Timestamp lastlogindate=res.getTimestamp("last_login_date");
				Timestamp createddate=res.getTimestamp("created_date");
				
				user=new User(userid, username, password, email, address, phonenumber, role,lastlogindate,createddate);
			}
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public void updateUser(User user) {
		try(Connection connection=DbConnection.getConnection();
				PreparedStatement pstmt= connection.prepareStatement(UPDATE_USERS);) {
			
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getAddress());
			pstmt.setString(5, user.getPhoneNumber());
			pstmt.setInt(6, user.getUserId());
			int res=pstmt.executeUpdate();
			System.out.println(res);
			
						
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
	}

	@Override
	public void deletUser(int userId) {
		try(Connection connection = DbConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(DELETE_USER);) {

				pstmt.setInt(1, userId);

				int res = pstmt.executeUpdate();
				System.out.println("Rows affected : " +res);

			} catch (SQLException e) {
				e.printStackTrace();
			}
		
	}
	
	@Override
	public User getUserByEmail(String email) {

	    User user = null;

	    try(Connection connection = DbConnection.getConnection();
	        PreparedStatement pstmt =
	            connection.prepareStatement(GET_USER_BY_EMAIL)) {

	        pstmt.setString(1, email);

	        ResultSet res = pstmt.executeQuery();

	        if(res.next()) {

	            user = new User(
	                res.getInt("user_id"),
	                res.getString("username"),
	                res.getString("password"),
	                res.getString("email"),
	                res.getString("address"),
	                res.getString("phone_number"),
	                res.getString("role"),
	                res.getTimestamp("last_login_date"),
	                res.getTimestamp("created_date")
	            );
	        }

	    } catch(Exception e) {
	        e.printStackTrace();
	    }

	    return user;
	}

	@Override
	public List<User> getAllUsers() {
		
		List<User>listOfUsers=new ArrayList<User>();
		
		try(Connection connection=DbConnection.getConnection();
				PreparedStatement pstmt= connection.prepareStatement(GET_ALL_USERS);) {
			
			
			ResultSet res=pstmt.executeQuery();
			
			while(res.next())
			{
				int userid=res.getInt("user_id");
				String username=res.getString("username");
				String password=res.getString("password");
				String email=res.getString("email");
				String address=res.getString("address");
				String phonenumber=res.getString("phone_number");
				String role=res.getString("role");
				Timestamp lastlogindate=res.getTimestamp("last_login_date");
				Timestamp createddate=res.getTimestamp("created_date");
				
				User user=new User(userid, username, password, email, address, phonenumber, role,lastlogindate,createddate);
				
				listOfUsers.add(user);
			}
			
						
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return listOfUsers;
	}

}
