
# 설치
sudo yum update -y
sudo yum install httpd -y

# 활성화 서버 시작 
sudo systemctl start httpd
sudo systemctl enable httpd


# 서버 확인 해보기 
sudo systemctl status httpd

# 파일들 로컬에서 EC2 전송

scp -i ~/path/to/leeseungyeop.pem ~/local/path/to/test.html ec2-user@<EC2-인스턴스-공용-IP>:/home/ec2-user/
