package com.callor.score.controller.api;

import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.callor.score.model.StudentVO;
import com.callor.score.service.StudentService;

import lombok.extern.slf4j.Slf4j;

/*
 * @Controller 클래스는 request에 대하여 view(.jsp)파일을
 * rendering하여 response하도록 설계하는 Router 클래스이다.
 * 
 * 이 클래스에 @ResponseBody를 부착하면 view를 response하는 대신에
 * 직접 문자열을 전송하거나 객체(List,VO)를 JSON type으로 response하도록
 * method에 적용을 안다.
 * 
 * @RestController 클래스는 request에 대해서
 * 기본값으로 JSON을 Response하도록 하는 Router클래스이다.
 * 모든 method에 마치 @ResponseBody가 부착된 것처럼 작동한다.
 * Spring RestController를 통하여 JSON 데이터를 response하기 위해서는
 * JackBind Dependency가 거의 필수적으로 요구된다.
 * 
 * RestController는 view를 rendering하지 앉는다.
 */
// CORS 오류를 해결하기 위해 CrossOrigin을 적어놓으면 해결한다. 
@Slf4j
@CrossOrigin(origins = {"http://localhost:3000", "http://127.0.0.1:3000","http://192.168.0.*:3000"})
@RestController
@RequestMapping(value="/api/student")
public class APIStuentController {
	
	private final StudentService studentService;
	
	public APIStuentController(StudentService studentService) {
		this.studentService = studentService;
	}
	
	@RequestMapping(value={"/",""},method=RequestMethod.GET)
	public List<StudentVO> student(){
		return studentService.selectAll();
	}	
	
	@RequestMapping(value="/{st_num}/check",method=RequestMethod.GET)
	public String stNumCheck(@PathVariable("st_num")String st_num ) {
		
		StudentVO stVO = studentService.findById(st_num);
		if( stVO == null) {
			return "OK";
		}else {
			return "FAIL";
		}
	}
	
	@RequestMapping(value="/{st_num}",method=RequestMethod.GET)
	public StudentVO getStudent(@PathVariable("st_num")String st_num) {
		return studentService.findById(st_num);
	}
	
	/*
	 * 클라이언트에서 fetch, Ajax 데이터를 POST 보낼때
	 * 데이터를 Serialize(직렬화) 하여 body에 담아서 전송을 한다.
	 * Serialize된 POST body에 담긴 데이터를 Controller에서 VO 받을때는
	 * 반드시 @RequestBody 속성을 추가하여 주어야한다.
	 */
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public String insert(@RequestBody StudentVO studentVO) {
		log.debug("데이터: {}",studentVO.toString());
		int ret = studentService.insert(studentVO);
		if(ret > 0) {
			return "OK";
		}else {
			return "FAIL";
		}
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update(@RequestBody StudentVO studentVO) {
		log.debug("데이터: {}",studentVO.toString());
		int ret = studentService.update(studentVO);
		if(ret > 0) {
			return "OK";
		}else {
			return "FAIL";
		}
	}

	@RequestMapping(value="/{st_num}/delete",method=RequestMethod.GET)
	public String delete(@PathVariable("st_num")String st_num) {
		/*
		 * mybatis에서 delete를 수행한 수 몇개의 데이터가 삭제 되었는지 return해준다.
		 * 여기서는 PK를 기준으로 삭제를 하기 때문에 return 값은
		 * 삭제가 되었으면 1이 될것이고 실패하면 1 미만의 값이 return 됨
		 */
			int ret =studentService.delete(st_num);
			if(ret > 0) {
				return "OK";
			}else {
				return "FAIl";
			}
	}
	
	/*
	 * method의 return type
	 * 
	 * void: 아무것도 없는 값을 return하거나 말거나
	 */
	public void voidMethod() {
		return;
	}
	
	//primitive : 정수,실수, 문자 등등의 기본 값을 return
	public int intMethod() {
		return 0; //return type이 int형 이므로 최소 0이라도 return
	}
	public char charMethod() {
		return 'a';//return type이 char형 이므로 최소 임의의 문자 한개라도 return
	}
	
	//class(참조) : String,VO,DTO,List 등의 클래스(객체) return
	public String strMethod() {
		return null; // return 할 값이 없으면 최소 null이라도 return
	}
}
