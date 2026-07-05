package com.tap.model;

public class OrderDetails {

	private int orderItemId;
	private int orderId;
	private String orderName;
	private int qty;
	private double totalPrice;

	public OrderDetails() {}

	public OrderDetails(int orderItemId, int orderId, String orderName, int qty, double totalPrice) {
		this.orderItemId = orderItemId;
		this.orderId = orderId;
		this.orderName = orderName;
		this.qty = qty;
		this.totalPrice = totalPrice;
	}

	public int getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(int orderItemId) {
		this.orderItemId = orderItemId;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "OrderDetails [orderItemId=" + orderItemId + ", orderId=" + orderId + ", orderName=" + orderName
				+ ", qty=" + qty + ", totalPrice=" + totalPrice + "]";
	}
}