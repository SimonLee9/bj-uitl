#!/bin/bash

# x11vnc 설치
sudo apt install x11vnc -y

# x11vnc 서비스 파일 생성
sudo bash -c 'cat > /etc/systemd/system/x11vnc.service <<EOF
[Unit]
Description=Start x11vnc server
After=multi-user.target

[Service]
Type=simple
Environment=DISPLAY=:0
ExecStart=/usr/bin/x11vnc -forever -nopw -display :0
Restart=always
User=$(whoami)

[Install]
WantedBy=multi-user.target
EOF'

# 포트 5900 허용
sudo ufw allow 5900

# systemd 데몬 재시작
sudo systemctl daemon-reload

# x11vnc 서비스 활성화 및 시작
sudo systemctl enable x11vnc
sudo systemctl start x11vnc

# x11vnc 서비스 상태 확인
sudo systemctl status x11vnc

# 팀뷰어 삭제 여부 확인
read -p "팀뷰어를 삭제하시겠습니까? (y/n): " answer
if [[ $answer == [Yy]* ]]; then
    dpkg -l | grep teamviewer
    sudo dpkg -r teamviewer
    echo "팀뷰어가 삭제되었습니다."
else
    echo "팀뷰어 삭제를 건너뜁니다."
fi
