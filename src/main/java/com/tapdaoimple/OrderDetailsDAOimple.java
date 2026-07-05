package com.tapdaoimple;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tap.dao.OrderDetailsDAO;
import com.tap.model.OrderDetails;
import com.tap.util.DbConnection;

public class OrderDetailsDAOimple implements OrderDetailsDAO {

	private static final String INSERT =
			"INSERT INTO order_details(order_id, item_name, qty, total_price) VALUES(?,?,?,?)";

	private static final String GET =
			"SELECT * FROM order_details WHERE order_item_id=?";

	private static final String UPDATE =
			"UPDATE order_details SET order_name=?, qty=?, total_price=? WHERE order_item_id=?";

	private static final String DELETE =
			"DELETE FROM order_details WHERE order_item_id=?";

	private static final String GET_ALL =
			"SELECT * FROM order_details";

	@Override
	public int addOrderDetails(OrderDetails od) {

		int res = 0;

		try(Connection con = DbConnection.getConnection();
			PreparedStatement pstmt = con.prepareStatement(INSERT))
		{

			pstmt.setInt(1, od.getOrderId());
			pstmt.setString(2, od.getOrderName());   // or getItemName() if you renamed it
			pstmt.setInt(3, od.getQty());
			pstmt.setDouble(4, od.getTotalPrice());

			res = pstmt.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public OrderDetails getOrderDetails(int orderItemId) {

		OrderDetails od = null;

		try(Connection con = DbConnection.getConnection();
			PreparedStatement pstmt = con.prepareStatement(GET))
		{

			pstmt.setInt(1, orderItemId);

			ResultSet res = pstmt.executeQuery();

			while(res.next())
			{
				od = new OrderDetails(
						res.getInt("order_item_id"),
						res.getInt("order_id"),
						res.getString("order_name"),
						res.getInt("qty"),
						res.getDouble("total_price"));
			}

		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return od;
	}

	@Override
	public void updateOrderDetails(OrderDetails od) {

		try(Connection con = DbConnection.getConnection();
			PreparedStatement pstmt = con.prepareStatement(UPDATE))
		{

			pstmt.setString(1, od.getOrderName());
			pstmt.setInt(2, od.getQty());
			pstmt.setDouble(3, od.getTotalPrice());
			pstmt.setInt(4, od.getOrderItemId());

			pstmt.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOrderDetails(int orderItemId) {

		try(Connection con = DbConnection.getConnection();
			PreparedStatement pstmt = con.prepareStatement(DELETE))
		{

			pstmt.setInt(1, orderItemId);
			pstmt.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	@Override
	public List<OrderDetails> getAllOrderDetails() {

		List<OrderDetails> list = new ArrayList<>();

		try(Connection con = DbConnection.getConnection();
			PreparedStatement pstmt = con.prepareStatement(GET_ALL))
		{

			ResultSet res = pstmt.executeQuery();

			while(res.next())
			{
				OrderDetails od = new OrderDetails(
						res.getInt("order_item_id"),
						res.getInt("order_id"),
						res.getString("order_name"),
						res.getInt("qty"),
						res.getDouble("total_price"));

				list.add(od);
			}

		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return list;
	}
}