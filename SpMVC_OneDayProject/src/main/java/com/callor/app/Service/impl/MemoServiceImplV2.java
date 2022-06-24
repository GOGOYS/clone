package com.callor.app.Service.impl;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.callor.app.Service.MemoService;
import com.callor.app.model.MemoVO;
import com.callor.app.persistance.MemoDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("serviceV2")
class MemoServiceImplV2 implements MemoService{
	
	private final MemoDao memoDao;
	
	//폴더의 정보를 수집하기 위한 도구
	private final ResourceLoader resLoader;
	private final String upLoadFolder;
	

	
	public MemoServiceImplV2(MemoDao memoDao, ResourceLoader resLoader,String upLoadFolder) {
		this.memoDao = memoDao;
		this.resLoader = resLoader;
		this.upLoadFolder = upLoadFolder;
	}
	
	@Override
	public void create_memo_table() {
		
		//memoDao.create_memo_table();
		
	}
	
	@Override
	public List<MemoVO> selectAll() {
		return memoDao.selectAll();
	}

	@Override
	public MemoVO findById(String  seq) {
		return memoDao.findById(seq);
	}

	@Override
	public int insert(MemoVO memoVO)  {
		
		return memoDao.insert(memoVO);
	}

	@Override
	public int update(MemoVO memoVO) {
		return memoDao.update(memoVO);
	}

	@Override
	public int delete(String seq) {
		return memoDao.delete(seq);
	}

	@Override
	public String fileUp(MultipartFile file) throws Exception {
		
		if(file == null) {
			return null;
		}
		
		File dir = new File(upLoadFolder);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		String fileName = file.getOriginalFilename();
		
		/*
		 * 파일 업로드를 할때 원래 파일이름을 그대로 저장하면 해킹등의 위협에 노출될 수 있다
		 * 파일이름 앞에 UUID 문자열을 첨부하여 파일을 저장하고
		 * 실제 사용자들에게 보여줄때는 원래 이름을 보여주는 식으로 코드를 작성해야 한다.
		 */
		// UUID 문자열 생성
		String strUUID = UUID.randomUUID().toString();
		
		fileName = String.format("%s-%s", strUUID, fileName);
		log.debug("변경된 파일 이름{} :",fileName);
		
		File upLoadFile = new File(upLoadFolder, fileName);
		file.transferTo(upLoadFile);
		return fileName;
	}

	@Override
	public String insertBbsAndFile(MemoVO memoVO, MultipartFile file) {

		return null;
	}


	

}
