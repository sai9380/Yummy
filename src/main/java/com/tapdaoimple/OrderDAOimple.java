package com.tapdaoimple;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tap.dao.OrderDAO;
import com.tap.model.Order;
import com.tap.util.DbConnection;

public class OrderDAOimple implements OrderDAO {
	
	private static final String GET_USER_ORDERS =
			"SELECT * FROM orders WHERE user_id=? ORDER BY order_date DESC";

	private static final String INSERT_ORDER =
			"INSERT INTO orders(user_id, restaurant_id, total_amount, order_date, address, payment_method, status) VALUES(?,?,?,?,?,?,?)";

	private static final String GET_ORDER =
			"SELECT * FROM orders WHERE order_id=?";

	private static final String UPDATE_ORDER =
			"UPDATE orders SET total_amount=?, address=?, payment_method=?, status=? WHERE order_id=?";

	private static final String DELETE_ORDER =
			"DELETE FROM orders WHERE order_id=?";

	private static final String GET_ALL =
			"SELECT * FROM orders";

	@Override
	public int addOrder(Order order) {

		int res = 0;

		try(Connection con = DbConnection.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
				        INSERT_ORDER,
				        PreparedStatement.RETURN_GENERATED_KEYS);)
		{

			pstmt.setInt(1, order.getUserId());
			pstmt.setInt(2, order.getRestaurantId());
			pstmt.setDouble(3, order.getTotalAmount());
			pstmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
			pstmt.setString(5, order.getAddress());
			pstmt.setString(6, order.getPaymentMethod());
			pstmt.setString(7, order.getStatus());

			res = pstmt.executeUpdate();
			
			ResultSet rs = pstmt.getGeneratedKeys();

			if (rs.next()) {
			    res = rs.getInt(1);
			}

		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public Order getOrder(int orderId) {

		Order order = null;

		try(Connection con = DbConnection.getConnection();
			PreparedStatement pstmt = con.prepareStatement(GET_ORDER))
		{

			pstmt.setInt(1, orderId);

			ResultSet res = pstmt.executeQuery();

			while(res.next())
			{
				int id = res.getInt("order_id");
				int userId = res.getInt("user_id");
				int restaurantId = res.getInt("restaurant_id");
				double total = res.getDouble("total_amount");
				Timestamp date = res.getTimestamp("order_date");
				String address = res.getString("address");
				String payment = res.getString("payment_method");
				String status = res.getString("status");

				order = new Order(id,userId,restaurantId,total,date,address,payment,status);
			}

		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return order;
	}

	@Override
	public void updateOrder(Order order) {

		try(Connection con = DbConnection.getConnection();
			PreparedStatement pstmt = con.prepareStatement(UPDATE_ORDER))
		{

			pstmt.setDouble(1, order.getTotalAmount());
			pstmt.setString(2, order.getAddress());
			pstmt.setString(3, order.getPaymentMethod());
			pstmt.setString(4, order.getStatus());
			pstmt.setInt(5, order.getOrderId());

			pstmt.executeUpdate();

		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

	}

	@Override
	public void deleteOrder(int orderId) {

		try(Connection con = DbConnection.getConnection();
			PreparedStatement pstmt = con.prepareStatement(DELETE_ORDER))
		{

			pstmt.setInt(1, orderId);
			pstmt.executeUpdate();

		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

	}
	
	@Override
	public List<Order> getOrdersByUserId(int userId) {

	    List<Order> list = new ArrayList<>();

	    try (Connection con = DbConnection.getConnection();
	         PreparedStatement pstmt = con.prepareStatement(GET_USER_ORDERS)) {

	        pstmt.setInt(1, userId);

	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {

	            Order order = new Order(
	                    rs.getInt("order_id"),
	                    rs.getInt("user_id"),
	                    rs.getInt("restaurant_id"),
	                    rs.getDouble("total_amount"),
	                    rs.getTimestamp("order_date"),
	                    rs.getString("address"),
	                    rs.getString("payment_method"),
	                    rs.getString("status"));

	            list.add(order);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}

	@Override
	public List<Order> getAllOrders() {

		List<Order> list = new ArrayList<>();

		try(Connection con = DbConnection.getConnection();
			PreparedStatement pstmt = con.prepareStatement(GET_ALL))
		{

			ResultSet res = pstmt.executeQuery();

			while(res.next())
			{
				Order order = new Order(
						res.getInt("order_id"),
						res.getInt("user_id"),
						res.getInt("restaurant_id"),
						res.getDouble("total_amount"),
						res.getTimestamp("order_date"),
						res.getString("address"),
						res.getString("payment_method"),
						res.getString("status"));

				list.add(order);
			}

		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return list;
	}
}