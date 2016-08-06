#!/bin/bash
echo "PID: $$";
flag="FAIL";
touch auth_pid.log;
echo "$$">auth_pid.log;
while true
do
	if (curl -sS https://www.u.tsukuba.ac.jp/~s1620731/|grep -q "Welcom")
	then
		if(test "$flag" = "FAIL")
		then
			date;
			echo "Connected.";
			flag="SUCCESS"
		else
			sleep 120;
		fi	
	else
		date;
		echo "Disonnected.";
		flag="FAIL";
		
		if (curl -sS -d "name=xxxxxxxx&pass=xxxxxxxx" https://webauth01.cc.tsukuba.ac.jp:8443/cgi-bin/adeflogin.cgi|grep -q "success")
		then
			date
			echo "Login success."
			flag="SUCCESS";
		else
			flag="FAIL";
			date;
			echo "Login fail.";		
			sleep 15;
		fi
	fi
done
