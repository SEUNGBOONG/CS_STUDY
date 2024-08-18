
# Spring Security 란 

- 스프링 부트 하위 프레임어크 Java 어플리케이션에 인증과 권한 부여를 제공하는데 중점을 둔 프렝미워크
- 필터기반으로 처리한다.
- 사용자 ID Password 를 받아 인증을하고 역할 및 권한을 부여한다.
- Cross Stie Script Forgery 같은 취약점에도 대응



# 사용법 
- 의존성을 추가하고
![스크린샷 2024-08-18 오후 5.38.14.png](..%2F..%2F..%2F..%2F..%2F..%2F..%2Fvar%2Ffolders%2Fm4%2Fn9zxyvgx4lx03pl_7nrbhpyr0000gn%2FT%2FTemporaryItems%2FNSIRD_screencaptureui_4JteAO%2F%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202024-08-18%20%EC%98%A4%ED%9B%84%205.38.14.png)
- 필요한 Bean 을 추가해주는 config 클래스 파일을 추가해줘야 한다.
- BCryptPasswordEncoder : password 암호화를 위해 BCryptPasswordEncoder클래스를 생성하여 빈에 등록해주었습니다.
  WebSecurityCustomizer : resouces를 접근할수 있도록 빈을 추가해주었습니다
  securityFilterChain
  csrf : 로컬에서 확인을 위해 csrf를 비활성화 시켜주었습니다
  authorizeHttpRequests : /(홈), /login(로그인 페이지), /join(회원가입 페이지)는 로그인 없이 접근하도록 셋팅하였습니다
  formLogin : /login 페이지를 커스터마이징 하여 로그인 체크를 할때 해당 url을 타도록 셋팅하고 로그인 성공시 /로 페이지 이동하도록 하였습니다


# 폴더위치
- 기본적으로  
- Spring Bean Configuraion File(XML 설정 파일) 또는 @Component Scan 대신 @Configuration 어노테이션 지정을 통해 .java 클래스 파일로 DI 지시서를 작성하는 기법
- 서비스에 둔다. 
