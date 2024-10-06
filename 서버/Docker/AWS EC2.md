# AWS EC2 배포 과정 정리

## 1. AWS EC2 인스턴스 생성 및 설정
- **EC2 인스턴스 생성**:
    - AWS 콘솔에서 `t2.micro` 인스턴스 생성 (Amazon Linux 2023 AMI 사용).

- **키 페어 생성 및 연결**:
    - 'leeseungyeop.pem'이라는 키 페어를 생성하여 다운로드.
    - 해당 키 파일을 이용해 SSH 접속 준비.

- **보안 그룹 설정**:
    - **Inbound Rules**:
        - SSH (포트 22) 및 HTTP (포트 80) 허용.
        - IP는 `0.0.0.0/0`로 설정하여 어디서든 접속 가능하도록 함.

---

## 2. EC2 인스턴스에 접속
- **SSH 접속**:
  ```bash
  ssh -i /path/to/leeseungyeop.pem ec2-user@<EC2-인스턴스-공용-IP>

# AWS 콘솔에서 진행할 작업

## 1. EC2 인스턴스 생성
1. **AWS EC2 콘솔**에 접속하여 `Launch Instance` 버튼을 클릭.
2. **인스턴스 이름** 입력.
3. **Amazon Machine Image(AMI)**:
    - Amazon Linux 2023 (무료 티어 사용 가능)을 선택.
4. **Instance Type**:
    - `t2.micro` (무료 티어 사용 가능)을 선택.
5. **Key Pair(키 페어)**:
    - **Create New Key Pair** 선택.
    - 키 페어 이름 입력 (`leeseungyeop` 등) 후, **.pem** 형식으로 다운로드.
    - 이 파일은 나중에 SSH 접속에 필요하므로 안전한 곳에 저장.
6. **Network Settings**:
    - 기본 VPC 설정 그대로 사용.
    - **Security Group**에서 새로운 보안 그룹 생성.
        - **SSH (포트 22)**, **HTTP (포트 80)** 규칙을 추가.
        - **Source**는 `0.0.0.0/0`으로 설정하여 어디서든 접속 가능하게 설정.
7. **Storage**: 기본 8GB 그대로 사용.
8. **Launch** 버튼 클릭하여 인스턴스 생성.

---

## 2. Elastic IP 할당 (선택사항)
- 인스턴스에 **고정 IP**를 할당하여, 인스턴스가 재시작되더라도 같은 IP를 사용할 수 있도록 설정할 수 있습니다.
1. **Elastic IP** 메뉴에서 **Allocate Elastic IP** 클릭.
2. 생성된 Elastic IP를 생성한 EC2 인스턴스에 연결.

---

## 3. EC2 인스턴스 접속 준비
- **SSH 접속**을 위한 키 페어 준비:
    - AWS 콘솔에서 다운로드한 `.pem` 파일을 로컬에서 사용할 준비.
    - 파일의 권한을 변경 (접근 제한):
      ```bash
      chmod 400 /path/to/leeseungyeop.pem
      ```

---

## 4. 보안 그룹 설정 (인스턴스 생성 시)
- 인스턴스 생성 중 설정한 **보안 그룹**에서 인바운드 규칙을 추가:
    1. **SSH** (TCP, 포트 22) 규칙 추가 (모든 IP 접근 허용: `0.0.0.0/0`).
    2. **HTTP** (TCP, 포트 80) 규칙 추가 (모든 IP 접근 허용: `0.0.0.0/0`).

---

## 5. 인스턴스 상태 확인 및 접속
1. 인스턴스가 **running** 상태로 변경되면, **Public IPv4 Address**를 확인.
2. 로컬 터미널에서 SSH를 통해 인스턴스에 접속:
   ```bash
   ssh -i /path/to/leeseungyeop.pem ec2-user@<EC2-인스턴스-공용-IP>

