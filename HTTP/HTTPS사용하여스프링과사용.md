HTTPS는 HTTP의 보안 버전으로, 데이터가 암호화되어 전송됩니다. 이를 위해 SSL/TLS 인증서를 사용합니다. Let's Encrypt와 같은 인증 기관에서 무료 인증서를 발급받거나, 자체 서명된 인증서를 사용할 수 있습니다. 이번 예제에서는 자체 서명된 인증서를 생성하고 이를 Spring Boot 애플리케이션에 적용하는 방법을 설명하겠습니다.



1. 자체 성명된  SSL 인증서 생성

1 -1 키스토어 생성 : keytool 명령어를 사용하여 SSL인증서를  생성하고 키스토어 파일로 저장한다. (keytool은 Java Development Kit(JDK)에 포함된 도구)

keytool -genkeypair -alias myalias -keyalg RSA -keysize 2048 -storetype PKCS12 -keystore keystore.p12 -validity 3650

git commit --date "Mon 12 Feb " -m 2023 10:00:00 KST"commit"


-alias myalias: 키의 별칭을 설정합니다.
-keyalg RSA: RSA 알고리즘을 사용하여 키를 생성합니다.
-keysize 2048: 키 크기를 2048 비트로 설정합니다.
-storetype PKCS12: 키스토어 유형을 PKCS12로 설정합니다.
-keystore keystore.p12: 키스토어 파일 이름을 keystore.p12로 설정합니다.
-validity 3650: 인증서 유효 기간을 3650일로 설정합니다.
1.2. 인증서 정보 입력
키스토어 생성 중에 다음과 같은 정보를 입력해야 합니다:

이름과 성
조직 단위
조직 이름
도시 또는 지역
주 또는 도
국가 코드 (예: US, KR)
키스토어에 대한 비밀번호입력
2. Spring boot 설정

2.1. application.properties 파일 설정

server.port=8443
server.ssl.key-store=classpath:keystore.p12
server.ssl.key-store-password=yourpassword #내가 설정한 키스토어 비밀번호
server.ssl.key-store-type=PKCS12
server.ssl.key-alias=myalias



3. HTTP에서 HTTPS로 리디렉션
   애플리케이션이 HTTP와 HTTPS 둘 다 수신하도록 설정하고, HTTP 요청을 HTTPS로 리디렉션하도록 설정할 수 있습니다.
3.1. 추가 설정 클래스 작성
   HttpToHttpsRedirectConfig 클래스를 작성하여 HTTP 요청을 HTTPS로 리디렉션합니다:

4.
HTTPS를 사용하여 Spring Boot 애플리케이션을 안전하게 만드는 방법을 단계별로 자세히 설명하겠습니다. HTTPS는 HTTP의 보안 버전으로, 데이터가 암호화되어 전송됩니다. 이를 위해 SSL/TLS 인증서를 사용합니다. Let's Encrypt와 같은 인증 기관에서 무료 인증서를 발급받거나, 자체 서명된 인증서를 사용할 수 있습니다. 이번 예제에서는 자체 서명된 인증서를 생성하고 이를 Spring Boot 애플리케이션에 적용하는 방법을 설명하겠습니다.

1. 자체 서명된 SSL 인증서 생성
   1.1. 키스토어 생성
   keytool 명령어를 사용하여 SSL 인증서를 생성하고 키스토어 파일로 저장합니다. keytool은 Java Development Kit(JDK)에 포함된 도구입니다.

bash
코드 복사
keytool -genkeypair -alias myalias -keyalg RSA -keysize 2048 -storetype PKCS12 -keystore keystore.p12 -validity 3650
위 명령어는 다음과 같은 옵션을 포함합니다:

-alias myalias: 키의 별칭을 설정합니다.
-keyalg RSA: RSA 알고리즘을 사용하여 키를 생성합니다.
-keysize 2048: 키 크기를 2048 비트로 설정합니다.
-storetype PKCS12: 키스토어 유형을 PKCS12로 설정합니다.
-keystore keystore.p12: 키스토어 파일 이름을 keystore.p12로 설정합니다.
-validity 3650: 인증서 유효 기간을 3650일로 설정합니다.
명령을 실행하면 여러 프롬프트가 나타나며, 여기에 대한 응답으로 필요한 정보를 입력해야 합니다.

1.2. 인증서 정보 입력
키스토어 생성 중에 다음과 같은 정보를 입력해야 합니다:

이름과 성
조직 단위
조직 이름
도시 또는 지역
주 또는 도
국가 코드 (예: US, KR)
마지막으로 키스토어와 키에 대한 비밀번호를 입력해야 합니다.

2. Spring Boot 설정
   생성된 키스토어 파일을 Spring Boot 애플리케이션에서 사용하도록 설정합니다.

2.1. application.properties 파일 설정
src/main/resources/application.properties 파일에 다음과 같이 설정을 추가합니다:

properties
코드 복사
server.port=8443
server.ssl.key-store=classpath:keystore.p12
server.ssl.key-store-password=yourpassword
server.ssl.key-store-type=PKCS12
server.ssl.key-alias=myalias
위 설정에서 keystore.p12 파일은 src/main/resources 디렉토리에 위치해야 합니다. yourpassword는 키스토어를 생성할 때 사용한 비밀번호입니다.

3. HTTP에서 HTTPS로 리디렉션
   애플리케이션이 HTTP와 HTTPS 둘 다 수신하도록 설정하고, HTTP 요청을 HTTPS로 리디렉션하도록 설정할 수 있습니다.

3.1. 추가 설정 클래스 작성
HttpToHttpsRedirectConfig 클래스를 작성하여 HTTP 요청을 HTTPS로 리디렉션합니다:

import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.servlet.server.ServletWebServerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
public class HttpToHttpsRedirectConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.requiresChannel()
                .anyRequest()
                .requiresSecure();
    }

    @Bean
    public ServletWebServerFactory servletContainer() {
        TomcatServletWebServerFactory tomcat = new TomcatServletWebServerFactory() {
            @Override
            protected void postProcessContext(org.apache.catalina.Context context) {
                var securityConstraint = new org.apache.catalina.deploy.SecurityConstraint();
                securityConstraint.setUserConstraint("CONFIDENTIAL");
                var collection = new org.apache.catalina.deploy.SecurityCollection();
                collection.addPattern("/*");
                securityConstraint.addCollection(collection);
                context.addConstraint(securityConstraint);
            }
        };
        tomcat.addAdditionalTomcatConnectors(createStandardConnector());
        return tomcat;
    }

    private org.apache.catalina.connector.Connector createStandardConnector() {
        var connector = new org.apache.catalina.connector.Connector(org.apache.coyote.http11.Http11NioProtocol.class.getName());
        connector.setScheme("http");
        connector.setPort(8080);
        connector.setSecure(false);
        connector.setRedirectPort(8443);
        return connector;
    }
}
4. Spring Boot 애플리케이션 실행
   4.1. 애플리케이션 실행
   Spring Boot 애플리케이션을 실행합니다. 기본적으로 HTTP 요청은 8080 포트에서 수신되며, HTTPS 요청은 8443 포트에서 수신됩니다. HTTP 요청은 HTTPS로 리디렉션됩니다.
5. 5. HTTPS 테스트
      5.1. 브라우저에서 테스트
      브라우저에서 https://localhost:8443를 열어 HTTPS를 통해 애플리케이션에 접근할 수 있는지 확인합니다.

5.2. HTTP 요청 리디렉션 테스트
브라우저에서 http://localhost:8080을 열어 HTTP 요청이 HTTPS로 리디렉션되는지 확인합니다. 요청은 https://localhost:8443로 리디렉션되어야 합니다.
6. 추가 설정 (운영 환경)
   6.1. 인증서 발급
   운영 환경에서는 Let's Encrypt와 같은 신뢰할 수 있는 인증 기관에서 인증서를 발급받는 것이 좋습니다.

6.2. 인증서 자동 갱신
Let's Encrypt와 같은 인증서는 90일 동안 유효하며, 자동 갱신 설정을 통해 인증서 갱신을 자동화할 수 있습니다.

이 과정들을 통해 Spring Boot 애플리케이션에서 HTTPS를 설정하고 안전한 통신을 구현할 수 있습니다. 이는 클라이언트와 서버 간의 데이터 전송을 보호하여 애플리케이션의 보안을 강화하는 데 중요한 역할을 합니다.


