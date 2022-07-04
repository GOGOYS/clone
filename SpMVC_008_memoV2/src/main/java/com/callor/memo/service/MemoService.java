package com.callor.memo.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.callor.memo.model.MemoDTO;
import com.callor.memo.persistance.MemoDao;

public interface MemoService{
	public List<MemoDTO> selectAll();
	
	public int insertAndUpdate(MemoDTO memo, MultipartFile file);
	public int delete(Long seq);
	
	public MemoDTO findById(Long seq);

	public List<MemoDTO> findByAuthor(String username);
	



	public int insert(MemoDTO memo);

	public int update(MemoDTO memo) ;



	public List<MemoDTO> findByIcon(String Icon);


	public void create_memo_table();

	public List<MemoDTO> findByPersonal(String Personal);

}