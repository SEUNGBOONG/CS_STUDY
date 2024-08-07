# DBMS

1. 사용자 데이터베이스 사이에서 데이터를 저장하고 분석하기 위해 상호작용하는 시스템
2. 운용하는 시스템으로 특징을 그대로 계승한다.

3. 구성 
   - 질의어 처리기: 사용자가 입력한 질의어를 분석하여 데이터베이스 처리기로 전송
   - DML 컴파일러: DML명령어를 분석하여 데이터베이스 처리기로 전송
   - 데이터베이스 처리기 : 실행되는동안 디비 연산을 저장데이터 관리자에게 전송
   - DDL 컴파일러: DBA가 작성한 DDL이나 스키마를 분석하여 저장 데이터 베이스관리자에게 전송
   - 저장 데이터 관리자: 사전의 접근 관리 운영체제에 파일 접근 요청 

4. 필수 기능 
   - 정의 : 논리적 물리적 구조정의
   - 조작 : 조회 생성 삭제 변경
   - 제어 : 동시성 제어 보안과 권한 기능


5. 종류 :
    - HDBMS: Hierarchical DBMS: 상하관계하여 관리하는 형태의 데이터베이스 시스템이다. 
      -  접근 속도가 빠르다. 
      - 종속 적이라서 구조 변화에 유연한 대응이 어렵다.
      - 1:N,N:M표현불가 
      
   
    - NDBMS: 데이터를 네트워크 형태로 관리한다
      - 상하 종속관계는 해결
      - 구성이 복잡함 
      - 1:N,N:M표현가능
    
    - RDBMS: 관계형 데이터베이스 
        - 업무변화에 적응력이 높아 유지보수 생산성이 향상
        - 릴레이션을 기준으로 상호간이 관계를 설정할수있다.




6. 용어 
   - 개체 타입 :
     - 현실 세계의 개념이나 대상을 데이터베이스로 표현하고자 하는 논리적인 표현 단위
   - 속성 :
     - 개체를 구성하는 고유의 특성 의미 있는 데이터의 가장 작은 논리적 단위
     - Column에 해당 한다 열에 해당

    - 도메인 :
      - 하나의 속성 값이 가질 수 있는 모든 원자 값의 집합 (분해할수 없는 값)
    - 튜플 : 
      - 하나의 개체를 표현하고 완전하고 고유한 정보 단위
      - 순서가 없다.
      - Row 행에 해당한다.
      - 릴레이션 인스턴스라고도 부름 
    - 릴레이션 : 
      - 데이터를 속성과 튜플로 구성된 2차원 테이블의 구조로 표현한 것이다 .
        -  차수 Degree: 전체 속성의 개수, 가로 줄 개수 
        -  기수 Cardinality: 전체 튜플의 개수  세로줄 위에 인스턴스 뺴고 
        
    - KEY: 
      - 분류 정렬하거나 검색할 때의 기준이 되는 속성
        - 후보키: 릴레이션에 존재하는 모든 튜플에 의해 유일성과 최소성을 모두 만족시키는 속성 
          - EX : 학번 주민번호 연락처 등

        - 기본키 : 후보키들 중 식별을 위해 지정된 속성
          -  중복과 널값을 가질 수 없다.
        -  슈퍼키 : 유일성을 만족하는 속성 
        - 외래키 : 관계된 다른 릴레이션의 기본키를 참조하는 속성 



