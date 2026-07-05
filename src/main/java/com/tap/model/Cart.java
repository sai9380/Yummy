package com.tap.model;

import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

public class Cart {

    private Map<Integer, CartItem> items = new LinkedHashMap<>();

    // Add item to cart
    public void addItem(Menu menu) {

        int menuId = menu.getMenuId();

        if (items.containsKey(menuId)) {

            CartItem item = items.get(menuId);
            item.setQuantity(item.getQuantity() + 1);

        } else {

            items.put(menuId, new CartItem(menu, 1));
        }
    }

    // Remove item
    public void removeItem(int menuId) {
        items.remove(menuId);
    }

    // Update quantity
    public void updateItem(int menuId, int quantity) {

        if (items.containsKey(menuId)) {

            if (quantity <= 0) {
                items.remove(menuId);
            } else {
                items.get(menuId).setQuantity(quantity);
            }
        }
    }

    // Get all cart items
    public Collection<CartItem> getItems() {
        return items.values();
    }

    // Total amount
    public double getTotalPrice() {

        double total = 0;

        for (CartItem item : items.values()) {
            total += item.getTotalPrice();
        }

        return total;
    }

    // Empty cart
    public void clear() {
        items.clear();
    }
}