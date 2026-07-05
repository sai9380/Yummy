package com.tap.dao;

import java.util.List;
import com.tap.model.OrderDetails;

public interface OrderDetailsDAO {

	int addOrderDetails(OrderDetails orderDetails);

	OrderDetails getOrderDetails(int orderItemId);

	void updateOrderDetails(OrderDetails orderDetails);

	void deleteOrderDetails(int orderItemId);

	List<OrderDetails> getAllOrderDetails();
}