package com.callor.images.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.callor.images.config.QualifierConfig;
import com.callor.images.model.FilesVO;
import com.callor.images.service.FileUpService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service(QualifierConfig.SERVICE.FILE_V2)
public class FileServcieImplV2 implements FileUpService{
	
	/*
	 * servlet-context의 bean으로 설정딘 값을 가져와서
	 * upLoadFolder에 담아라
	 */
	private final String upLoadFolder;
	
	public FileServcieImplV2(String upLoadFolder) {
		// TODO Auto-generated constructor stub
		this.upLoadFolder = upLoadFolder;
	}

	@Override
	public String fileUp(MultipartFile file) throws Exception {
		// TODO Auto-generated method stub
		
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
	public List<FilesVO> filesUp(MultipartHttpServletRequest files) throws Exception {
		
		
		//업로드 된 여러개의 파일정보 list에 암기
		List<FilesVO> retFiles = new ArrayList<>();
		
		//DB insert하기 위한 리스트를 만들기 위하여 생성
		List<MultipartFile> fileList = files.getFiles("mFile");
		
		//fileList를 for() 반복문으로 반복하면서
		//각강의 파일을 fileUp() 메서드레게 보내서 개별아링를 업로드 수행
		//uuID fileNmae을 return 받기
		
		//원래 파일 이름과 uuID가 부착된 파일이름으로 FilesVO를 생성하고
		//retFiles에 추가하기
		for(MultipartFile file : fileList) {
				
			String originName = file.getOriginalFilename();
			String uuName = this.fileUp(file);
			
			FilesVO fileVO = FilesVO.builder()
							.i_originalName(originName)
							.i_imageName(uuName)
							.build();
			retFiles.add(fileVO);
		}
		return retFiles;
	}

	@Override
	public boolean fileDelete(String filename) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<FilesVO> fineByBBsSeq(long b_seq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertFiles(List<FilesVO> fileNames) {
		
		return 0;
	}

	@Override
	public List<FilesVO> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public FilesVO findById(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(FilesVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(FilesVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Long id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
