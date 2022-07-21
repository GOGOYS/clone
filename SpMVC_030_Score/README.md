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