package com.callor.app.Service;

import org.springframework.web.multipart.MultipartFile;

import com.callor.app.model.MemoVO;
import com.callor.app.persistance.MemoDao;

public interface MemoService extends MemoDao{
	
	public String fileUp(MultipartFile file) throws Exception;
	public String insertBbsAndFile(MemoVO memoVO, MultipartFile file);
	
	
}
