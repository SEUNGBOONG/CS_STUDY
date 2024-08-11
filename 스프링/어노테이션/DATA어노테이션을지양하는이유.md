# data 어노테이션

- ToString Getter Setter EqualsAndHashCode RequiredArgsConstructor 을 모두 포함하는 강력한 어노테이션이다
- @ToString : toString 메소드를 자동생성

- @Getter : 모든 필드의 getter메소드 가 자동 생성

- @Setter : 모든 필드의 setter 메소드가 자동 생성
  
- @EqualsAndHashCode : equals, hashCode 메서드 자동생성
  
- @RequiredArgsConstructor : final이나 @NonNull인 필드 값만 파라미터로 받는 생성자 자동생성.

- 예를 들어 id의 필드가 변경을 허용치 않기로했다면 setter가 없어야한다. 
- 하지만 data를 사용하면 id필드도 세터가 생성되기떄문에 안정성을 보장받을 수 없게됩니다.!