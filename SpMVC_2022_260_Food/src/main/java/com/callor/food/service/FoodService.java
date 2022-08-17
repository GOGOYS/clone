package com.callor.food.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.callor.food.model.FoodItem;

@Service
public interface FoodService {
	
	public String queryString(String search);
	public List<FoodItem> getFoodItems(String queryString);
}
