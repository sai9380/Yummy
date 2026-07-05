package com.tap.dao;

import java.util.List;
import com.tap.model.Menu;

public interface MenuDAO {

	int addMenu(Menu menu);

	Menu getMenu(int menuId);

	void updateMenu(Menu menu);

	void deleteMenu(int menuId);

	List<Menu> getAllMenus();
	
	List<Menu> getAllMenuItems();
	
	List<Menu> getTopRatedMenus();
	
	List<Menu> searchMenu(String keyword);
	
	List<Menu> getMenuByRestaurantId(int restaurantId);
}