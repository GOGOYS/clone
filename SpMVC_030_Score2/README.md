# 성적처리 프로젝트
* SpMVC_030_Score

## DB 연결
* MySQL의 schoolDB
## TABLE
* tbl_student,tbl_score, tbl_subject

## DB 연결을 위한  MAVEN Dependency 설정
* Spring-jdbc
* commons-dbcps
* mybatis
* mybatis-spring
* mysql-connector/J
* spring-framework : 5.2.22 REL
* lombok
* logback-classic

## package 생성
* model package, persistance package

## mapper folder 생성
* /WEB-INF/spring/mapper

## VO 클래스 생성
* tbl_student, tbl_score, tbl_subject를 참조하여
각각 studentVO, scoreVO, subjectVO 를 model package에 생성

## Dao 인터페이스 생성
* persistance.GenericDao interface
CURD method 선언

## Student 정보 요청
* http://localhost:8080/score/student로 요청을 하면
학생데이터 전체를 JSON 웹 화면에 보여주는 코드 작성
* StudentController에 @ResponseBody 부작된 home() method() 선언
* StudentService.selectAll()
* StudentDao.selectAll()
* student-mapper.xml.selectAll

## thymeleaf를 이용한 view 구현
* Spring에서 JSP가 아닌 html방식으로 화면을 구현하기
* JSP는 Sts나 Spring을 지원하는 Tool에서만 파일을 편집 할 수 있다.
* thymeleaf는 HTML과 tag의 속성을 사용하여 데이터를 표현하는 방법이기 때문에 다 HTML과
편집도구를 사용하여 파일을 편집할 수 있다.
* 데이터를 화면에 Rerndering하기 위하여 JSP는 Eltag를 직접 사용하여
화면에 표시 되도록 하지만, thymeleaf는 tag내에서 th:text라는 속성을 사용하여 표현한다.
이런 방식으로 데이터를 표현하면 디자이너와 개발자가 효율적으로 협업을 할 수 있다.
* 데이터를 표현하는데, 단축형 들을 지원하여 좀 더 간결한 코드를 사용할 수 있다.

## 기본 문법
* 데이터 표현하기 : th:text="${변수}"
* 반복문 표현하기 : th:each="요소 : ${리스트}"
* 변수 단축하기 : th:object=${변수} => 변수의 요소들 : "*{요소}"
* URL 표현하기 : th:href="@{주소}", th:src="@{주소}"
* rootPath : /*[[@{/}]]*/
* data 속성 : th:attr="data-변수명=${값이 담긴 변수}"
* if문 
```

	<div th:if="${변수 == 3}">
		여기는 변수 == 3 값이 true일때만 표현되는 영역
	</div>
	<span th:if="${변수.equals('재직중')}">재직중</span>
```
* if else
```
	<span th:if="{변수 == 3" th:text="${변수}"></span>
	<span th:unless="${변수 == 4}" th:text="값 오류"></span> 
```

## thymeleaf layout diaract
* thymeleaf template를 사용하여 화면 layout을 구현하기 위한 도구
* thymeleaf에서 공식적으로 지원하는 layout구현 도구가 없어서 외부 도구 사용
```
<!-- https://mvnrepository.com/artifact/nz.net.ultraq.thymeleaf/thymeleaf-layout-dialect -->
		<dependency>
			<groupId>nz.net.ultraq.thymeleaf</groupId>
			<artifactId>thymeleaf-layout-dialect</artifactId>
			<version>3.1.0</version>
		</dependency>
```

## thymeleaf 파일 연결하기
* th:include : 파일을 합성하여 완전히 한 파일로 생성하기 : Controller에서 model에 담아 보낸 변수를 모두가 공유 가능
* th:insert : 현재 태그의 내부에 끼워넣기
* th:replace : 현재 태그를 지우고 대체하기