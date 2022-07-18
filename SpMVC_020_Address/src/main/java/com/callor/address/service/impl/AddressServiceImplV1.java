package com.callor.address.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.callor.address.config.QualifyConfig;
import com.callor.address.model.AddressVO;
import com.callor.address.persistance.AddressDao;
import com.callor.address.service.AddressService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service(QualifyConfig.SERVICE.ADDR_V1)
public class AddressServiceImplV1 implements AddressService{
	
	/*
	 * service interfate 에서 Dao를 상속받고 있는 상태에서
	 * ServiceImpl 클래스에서 Dao를 생성자로 주입받는 경우
	 * 생성자에서 오류가 발생하는 경우가 있다... circular reference : 무한 반복 주입 오류
	 * 위와 같은 오류가 나는 경우 생성자 주입대신 setter주입으로 변경하면 오류가 안난다
	 */
	private final AddressDao addrDao;
	
	public AddressServiceImplV1(AddressDao addrDao) {
		this.addrDao = addrDao;
	}
	
	//setter 주입 하는 방법
	//@Autowired
	//private AddressDao addrDao;	
	//public AddressServiceImplV1() {
	//}
	
	//프로젝트가 시작될때 테이릅릉 자동으로 생성하기 위한 자동실행 method
	//기존의 method를 사용하면 무한루프에 빠져서 돌아갈때가 으니 따로 메서드를 사용할것
	@Autowired
	public void create_table() {
		addrDao.create_addr_table();
	}

	@Override
	public List<AddressVO> selectAll() {
		// TODO Auto-generated method stub
		return addrDao.selectAll();
	}

	@Override
	public AddressVO findById(long seq) {
		// TODO Auto-generated method stub
		return addrDao.findById(seq);
	}

	@Override
	public int insert(AddressVO address) {
		// TODO Auto-generated method stub
		log.debug("인서트 : {}",address.toString());
	
		return addrDao.insert(address);
	}

	@Override
	public int update(AddressVO address) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(AddressVO address) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void create_addr_table() {
		// TODO Auto-generated method stub
		
	}


}
