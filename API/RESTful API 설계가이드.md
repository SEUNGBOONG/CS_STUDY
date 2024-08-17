# REST ful API


# URL Rules 
- 마지막에 / 포함하지 않는다.
- underBar 대신에 dash 사용한다. 즉 "-" 사용
- 행위는 포함하지 않는다. 즉 명사로 해야한다.
- 컨트롤 자원을 의미하는 URL 예외적으로 동사를 허용한다.

# Set HTTP Headers 
- Content - Location :Json을 우선으로 제공한다 이원화 하지 말자 
- Content-Type
-  Retry-After :


# Use HTTP methods
- post get put delete 4가지 메서드 반드시 제공

#Use HTTP status
- 의미에 맞는 HTTP status를 리턴한다.
- HTTP status만으로 상태 에러를 나타낸다



# Use the correct HTTP status code
- 성공 응답은 2XX로 응답한다.
- - 실패 응답은4XX로 응답한다
- 5xx 에러는 절대 사용자에게 나타내지 마라!

![스크린샷 2024-08-17 오전 9.47.27.png](..%2F..%2F..%2F..%2F..%2F..%2Fvar%2Ffolders%2Fm4%2Fn9zxyvgx4lx03pl_7nrbhpyr0000gn%2FT%2FTemporaryItems%2FNSIRD_screencaptureui_924LDF%2F%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202024-08-17%20%EC%98%A4%EC%A0%84%209.47.27.png)
