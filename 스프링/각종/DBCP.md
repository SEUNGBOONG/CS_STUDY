

# 1. 커넥션 풀(DBCP)
- WAS가 실행되면서 DB와 미리 connection 해놓은 객체들을 pool에 저장
- Client 요청이 오면 connection을 빌려주고, 처리가 끝나면 다시 connection을 반납받아 pool에 저장하는 방식이다, 

HTTP -> [Connection 요청] -> Connection Pool -> DB 

Connection -> [Connection 제공] -> HTTP

HTTP -> [Connection 반환] -> Connection Pool

# 2. 사용 이유

- JAVA에서 DB에 직접 연결해서 처리하는 JDBC드라이버를 로드하고 커넥션 객체를 반환 해야함 
- 그러면 매번 사용자가 요청을 할 때마다 드라이버를 로드하고 커넥션 객체를 생성하여 연결하고 종료한다.
- 이렇게 되면 비효율적이다. -> 이런 문제를 해결하기 위해 커넥션 풀을 사용한다. 

# 3. DBCP?
- DataBase Connection Pool : DB와 커넥션을 맺고 있는 객체를 관리한다. 
- WAS가 실행되면서 connection 객체를 미리 pool생성해둔다. 
- HTTP 요청에 따라 pool에서 connection 객체를 가져다 쓰고 반환한다.
- 데이터베이스 연결 부하를 줄이고 연결 관리
- pool에 미리 커넥션이 생성되어 있기 떄문에 요청마다 연결시간이 소비되지 않음 
- 커넥션을 재사용 가능 하기 떄문에 커넥션 수를 제한적으로 설정한다.


# 4. 동시 접속자가 많을 경우
- 동시 접속할 경우 poolㅇㅔ서 미리 생성된 커넥션을 제공 사용자는 커넥션이 반환될 때 까지 번호순대로 대기 상태 
- 커넥션 풀을 크게 설정하면 메모리 소모가 큰 대신 사용자 대기 시간이 줄어들고 커넥션 풀을 적게 설정하면 대기시간이 길어진다.
- 
