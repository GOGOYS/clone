package com.callor.naver.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@ToString
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BuyBooksVO {
	
	public String b_isbn;
	public String b_username;
	public String b_date;
	
	private BookVO book;
	private UserVO user;
}
