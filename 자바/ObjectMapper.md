# Object Mapper 란 ?

- JSON 컨텐츠를 Java 객체로 deserialzation 하거나 java 객체를 JSON으로 
- 할 때 사용하는 JAckson라이브러리 클래스이다. 
- 생성비용이 비싸기 때문에 bean/static으로 처리하는 것이 좋다.

1분 튜토리얼: POJOs에서 JSON으로, 그리고 다시 반대로
가장 일반적인 사용법은 JSON 조각을 가져와서 POJO(Plain Old Java Object)를 구성하는 것입니다. 간단한 2개의 속성을 가진 POJO를 예로 들어보겠습니다:

public class MyValue {
public String name;
public int age;
}
ObjectMapper mapper = new ObjectMapper();
MyValue value = mapper.readValue(new File("data.json"), MyValue.class);
mapper.writeValue(new File("result.json"), myResultObject);
