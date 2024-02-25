
- > HTTPS란 기존의 HTTP 프로토콜에 SSl이라는 Security Layer를 한층 올린 통신프로토콜이다.
  > 통신 원리는 기존 HTTP와 비슷 end points간에 data를 주고받을 때 좀더 안전하다.
  > HTTP : Hypertext Transfet Protocol html을 전송하기 위한 통신규약이다.
  > 두개의 엔드포인트가 중요한 정보를 주고받는 상황에서 악의적인 공격자가 중요한 정보를 탈취해 악용할 가능성이 있다 .
  > 이것을 개선한것이 HTTPS endpoints간에 약속한 시크릿 키로 전송해서 내용을 알수 없다 .
  > 
> 스프링에서 SSL/HTTPS를 적용하기 위해서는 
> 1. SSL인증서 얻기  : 실제로 배포하는 app은 정식인증을 받은 SSL인증서를 사용한다.
> - >self-signed SSL 인증서의 대표적인 종류 2가지

* JKS (JAVA KeyStore)의 줄임말로 PKCS12와 비슷하지만 JAVA환경에서만 사용이 가능하다.

* PKCS12 (Public Key Cryptograhic Standards)의 줄임말로 패스워드로 보호된 형식으로써, 
* 여러 인증서 및 키를 포함할 수 있다. 
* Java뿐만 아니라 여러 플랫폼에서 사용 가능하다.
* keytool -genkeypair -alias bootsecurity -keyalg RSA -keysize 2048 -storetype PKCS12 -keystore bootsecurity.p12 -validity 3650
* alias: 파일 별칭으로 자신이 원하는 이름으로 하면된다.
* keyalg: 키알고리즘을 RSA로 설정 
* keystore: 개인키 파일 
* 위의 명령어를 입력하고 비밀번호를 입력하면되고, 이후에 묻는 정보는 각자 정보에 맞게 대답하고 마지막 확인하는 질문에 yes를 입력하면된다.
* 생성된 인증서SSL을 spring boot에 resources하위에 두면된다.
* 이제 ssl 인증서 정보를 appliactaion.yml에 입력한다.

server:
port: 443
ssl:
enabled: true
key-store: src/main/resources/bootsecurity.p12
key-store-password:
key-store-type: PKCS12
key-alias: bootsecurity
ServletWebServerFactory @Bean을 선언해 SSL Traffic을 open 한다.
httpToHttpsRedirectConnector을 생성해 8080(HTTP)의 request를 443(HTTPS)로 redirect 한다.

> 2. application.yml 수정하기 
> 3. ServletWebServerFactory을 @Bean으로 등록하기 
> 4. 