# Ec2 배포

1. EC2 에 접속 한다. 
2. git 설치 세팅 
3. git pull 
4. ./gradlew build (ec2에서 jar를 만든다. )
5. project/build/libs에 가서 nohup 
   - java -jar investement-0.0.1-SNAPSHOT.jar > output.log 2>&1 &
   - nohup: 세션 종료 시에도 프로세스가 종료되지 않도록 합니다.
     java -jar investement-0.0.1-SNAPSHOT.jar: JAR 파일을 실행합니다.
> output.log: 표준 출력을 output.log 파일로 리디렉션합니다.
2>&1: 표준 에러 출력을 표준 출력으로 리디렉션합니다. 즉, 에러 메시지도 output.log에 기록됩니다.
&: 명령어를 백그라운드에서 실행합니다.
