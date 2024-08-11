# H2

- 자바 기반 오픈소스 RDBMS
- 세가지 용도를 찾을 수 있는데
  - Embedded Mode
  - In-memory Mode
  - Server Mode


1. Server_Mode 는 터미널로 실행하면 h2 가 TCP 통신을 할 수 있는 서버 버전으로 실행된다
   - 따라서 외부에서 서버기 실행되어야 application.properties에 서버 주소를 입력해 접속할 수 있다.

2. Embedded Mode : 
    - java-jar로 실행시켜야한다. 이는 스프링 부트 안에서 한번에 띄우는 것이 아니기 때문에 불편한 편이다.
    - 빌드그레들에 의존성을 추가하여 쓸수 있어 편하다.
    - 테스트 용도로 자주 사용된다
    - build.gradle에 의존성을 추가해서 사용 가능
    - h2는 실행하면 웹 환경에서 DB를 손쉽게 활용할 수 있다. 
    - localhost:8080/h2-console를 통해 접속
   