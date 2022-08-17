package com.callor.food.model;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class FoodItem {
	
	@JsonProperty("UC_SEQ")
	private String UC_SEQ;
	@JsonProperty("MAIN_TITLE")
	private String MAIN_TITLE;
	@JsonProperty("GUGUN_NM")
	private String GUGUN_NM;
	@JsonProperty("LAT")
	private String LAT;
	@JsonProperty("LNG")
	private String LNG;
	@JsonProperty("PLACE")
	private String PLACE;
	@JsonProperty("TITLE")
	private String TITLE;
	@JsonProperty("SUBTITLE")
	private String SUBTITLE;
	@JsonProperty("ADDR1")
	private String ADDR1;
	@JsonProperty("ADDR2")
	private String ADDR2;
	@JsonProperty("CNTCT_TEL")
	private String CNTCT_TEL;
	@JsonProperty("HOMEPAGE_URL")
	private String HOMEPAGE_URL;
	@JsonProperty("USAGE_DAY_WEEK_AND_TIME")
	private String USAGE_DAY_WEEK_AND_TIME;
	@JsonProperty("RPRSNTV_MENU")
	private String RPRSNTV_MENU;
	@JsonProperty("MAIN_IMG_NORMAL")
	private String MAIN_IMG_NORMAL;
	@JsonProperty("MAIN_IMG_THUMB")
	private String MAIN_IMG_THUMB;
	@JsonProperty("ITEMCNTNTS")
	private String ITEMCNTNTS;


}
