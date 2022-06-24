package com.callor.app.persistance;

import java.util.List;

import com.callor.app.model.MemoVO;

public interface MemoDao {
	
	public List<MemoVO> selectAll();
	public MemoVO findById(String seq);
	public int insert(MemoVO memoVO);
	public int update(MemoVO memoVO);
	public int delete(String seq);
	public void create_memo_table();

}
