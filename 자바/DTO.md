
4. DTO (Data Transfer Object)
   장점 및 설명:
DTO는 데이터 전송 객체로, 주로 데이터베이스에서 데이터를 읽거나 클라이언트로 데이터를 전송하기 위해 사용됩니다.
DTO는 데이터 구조를 표현하며, 비즈니스 로직을 가지지 않습니다. 단순히 데이터를 보관하고 전송하는 역할을 합니다.
클라이언트와 서버 간의 데이터 전송을 표준화하고, 서로 다른 계층 간 데이터 교환을 쉽게 할 수 있습니다.



서비스 로직에서는 Long userId와 같은 원시 타입을 사용하고,
컨트롤러에서는 DTO 형식을 사용하는 것은 좋은 설계입니다. 이러한 방식은 계층 간의 책임을 명확히 분리하고, 코드의 유지보수성과 유연성을 높이는 데 도움이 됩니다. 단, 프로젝트의 규모와 복잡성을 고려하여 적절히 적용하는 것이 중요합니다.
