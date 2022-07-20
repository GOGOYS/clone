# tiles를 사용한 JSP Layout 만들기
* View page(JSP)의 header, side, footer등을 include 처리하여 Layout을 구성하는 도구
* JSP page ```<% include file="...">``` 형식으로 JSP 파일을 서로 연결하여 Layout을 구성하는데
	성능상의 이슈등이 있고, JSP 파일들이 많아지면 관리가 불편해지는 단점이있다.
* 이러한 단점을 극복하과 사용하는 Layout 도구

* 필요한 Dependency 설정
```
		<!-- https://mvnrepository.com/artifact/org.apache.tiles/tiles-core -->
		<dependency>
			<groupId>org.apache.tiles</groupId>
			<artifactId>tiles-core</artifactId>
			<version>${org.tiles-version}</version>
		</dependency>
		<!-- https://mvnrepository.com/artifact/org.apache.tiles/tiles-extras -->
		<dependency>
			<groupId>org.apache.tiles</groupId>
			<artifactId>tiles-extras</artifactId>
			<version>${org.tiles-version}</version>
		</dependency>
```
* 위의 두가지만 pom.xml에 넣으면 tiles-jsp나 tiles-servlet등 필요한 모든것들을 다 가져온다
