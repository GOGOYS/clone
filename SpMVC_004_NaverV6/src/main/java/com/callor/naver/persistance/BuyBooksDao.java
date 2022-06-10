package com.callor.naver.persistance;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.callor.naver.model.BuyBooksVO;

public interface BuyBooksDao {
	
	public List<BuyBooksVO>selectAll();
	
	/*
	 * mapper와 연동할때 mapper에게 전달하는 변수가 2개 이상일때는 
	 * 각각의 변수에 @Param 속성을 지정해 주어야한다
	 * 그렇지 않으면 mapper가 어떤 변수에 데이터가 담겨있는지 혼동하게 된다.
	 */
	public BuyBooksVO findByIsbnAndUsername(@Param("isbn")  String isbn,@Param("username") String username);
	
	public List<BuyBooksVO>findByIsbn(String isbn);
	public List<BuyBooksVO>findByUsername(String username);
	
	public int insert(BuyBooksVO vo);
	
	
}
