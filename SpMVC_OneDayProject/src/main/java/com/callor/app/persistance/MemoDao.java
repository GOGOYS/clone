package com.callor.app.persistance;

import java.util.List;

import com.callor.app.model.MemoVO;

public interface MemoDao {
	
	public List<MemoVO> selectAll();
	public MemoVO findById(int m_seq);
	public int insert(MemoVO memoVO);
	public int update(MemoVO memoVO);
	public int delete(int m_seq);
	public void create_memo_table();

}
