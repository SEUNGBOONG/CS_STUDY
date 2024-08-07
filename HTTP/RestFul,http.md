# Rest란 ?

- Representational State Transfer : 네트워크 아키텍처 원칙을 기반으로 한 웹 서비스 디자인 방식이다.
- 리소스를 기반으로 한 설계 철학을 따르며 이러한 리소스는 URL을 통해 식별된다. 
- 쉽게 말해 네트워크상에서 클라이언트와 서버사이의 통신 방식 

# 주요 원칙 
- 클라이언트 - 서버 구조 : 서로 독립적이어하고, 클라이언트는 URL만 알아야한다.
- 그리고 클라이언트와 서버의 인터페이스가 변경되지 않는 한 이둘은 독립적으로 개발되거나 대체될 수 있게 유지해야한다.

- 무상태성 : 각요청은 독립적이며, HTTP요청에 대한 어떤 것도 저장하지 않는다. 
- Cacheable: 서버는 리스폰스 캐시 컨트롤 헤더에 해당 요청이 캐싱이 가능한 자에 대한 여부를 제공해야한다.
- 레이어 시스템 : 레스트는 다중 계층 구조를 가질 수 있도록 허용한다. API서버와 데베 서버를 따로두는 느낌 
- 레이어는 자기와 통신하는 컴포넌트 외 레이어에 대해서는 정보를 얻을 수 없다 .


# HTTP 메서드란 
 - 클라이언트와 서버 간의 통신에서 사용된다. 각 메서드는 특정한 작업을 수행하며 RESTful 서비스에서 리소스 조작을 위해 주로 사용됨 


1. GET - 서버에서 리소스를 조회
   - 안전성 : 서버 상태를 변경하지 않는다.
   - 멱등성 : 동일한 요청을 여러 번 수행해도 결과가 동일
   - 캐싱 : GET 요청은 캐싱할 수 있다.

2. POST - 서버에 새로운 리소스를 생성
   - 안전성 : 서버 상태를 변경
   - 멱등성 : 동일한 요청을 여러 번 수행하며 여러 개의 리소스가 생성 될 수 있음
   - 캐싱 : 일반적으로 캐싱하지 않음

3. PUT : 서버의 기존 리소스를 업데이트 주로 전체 수정 
    - 안전성 : 서버 상태를 변경
    - 멱등성 : 동일한 요청을 여러 번 수행해도 결과가 동일 
    - 캐싱 : 일반적으로 x

4. PATCH : 서버의 기존 리소스를 부분적으로 업데이트
   - 안전성 : 서버 상태를 변경 
   - 멱등성 : 동일한 요청을 여러 번 수행해도 결과가 동일
   - 캐싱 : 일반적으로 캐싱하지 않음


