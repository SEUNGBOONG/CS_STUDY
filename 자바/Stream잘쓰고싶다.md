
1. 스트림(Stream)은 자바 8부터 도입된 함수형 프로그래밍 스타일의 API로, 컬렉션 데이터를 처리하는 데 유용한 기능을 제공합니다. 스트림을 잘 활용하기 위해서는 몇 가지 주요 개념과 주의할 점들을 이해하는 것이 중요합니다.
2. 데이터 소스: 스트림은 데이터 소스 컬렉션 배열 등에서 데이터를 가져와 처리한다. 
3. 중간연산: 중간 연사은 스트림을 변환하거나 필터링하는 연산을 수행한다. 
4. 종단 연산 스트림의 요소를 소모하여 최종 결과를 도출하는 연산


1. filter : 조건에 맞는 요소를 걸러낸다.
 List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5);
   List<Integer> evenNumbers = numbers.stream()
   .filter(num -> num % 2 == 0)
   .collect(Collectors.toList());


2. map : 요소를 다른 값으로 변환한다.

List<String> names = Arrays.asList("Alice", "Bob", "Charlie");
List<Integer> nameLengths = names.stream()
.map(String::length)
.collect(Collectors.toList());

3. flatMap : 스트림의 각요소에 대해 매핑함수를 적용하고 결과를 하나의 스트림으로 병합

List<List<Integer>> listOfLists = Arrays.asList(Arrays.asList(1, 2), Arrays.asList(3, 4));
List<Integer> flattenedList = listOfLists.stream()
.flatMap(List::stream)
.collect(Collectors.toList());



4. sorted: 요소를 정렬한다.
   List<String> names = Arrays.asList("Alice", "Bob", "Charlie");
   List<String> sortedNames = names.stream()
   .sorted()
   .collect(Collectors.toList());

5. collect : 스트림의 요소를 수집한다.
   List<String> names = Arrays.asList("Alice", "Bob", "Charlie");
   String result = names.stream()
   .collect(Collectors.joining(", "));


6. forEach : 각 요소에 대해 주어진 동작을 수행한다.
   List<String> names = Arrays.asList("Alice", "Bob", "Charlie");
   names.stream()
   .forEach(System.out::println);


7. reduce : 스트림의 요소를 하나로 줄인다.

List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5);
Optional<Integer> sum = numbers.stream()
.reduce((a, b) -> a + b);


고려할 점 : 
- 지연연산 :스트림은 필요할 때만 요소를 처리하므로 중간 연산이 실행될때까지 최종연산이 실행되지않는다.
- 병렬 처리 : parallel() 메서드를 사용하여 스트림의 요소를 병렬로 처리할 수 있다.
  - 이는 멀티코어 프로세서에서 성능을 향상시킴
- 불변성: 스트림연산은 기존 데이터를 변경하지 않고 새로운 스트림을 생성하므로, 함수형 프로그래밍의 불변성 원칙을 따른다.

각 연산의 특성과 활용방법을 잘 이해하고 적절히 활용함으로써 가독성과 유지보수성을 높여보자 
