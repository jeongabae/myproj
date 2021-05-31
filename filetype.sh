#!/bin/sh
read -p "파일/디렉토리 이름 입력 " filename

if [ ! -e $filename ]
then
	echo "$filename은 존재하지 않습니다."
	exit 0
fi

filetypes="d L c b p S f"
for filetype in $filetypes
do
	if [ -$filetype $filename ]
	then	
		echo -n "$filename은 "
		case $filetype in
			'd') echo "디렉토리입니다.";;
			'L') echo "심볼릭링크입니다.";;
			'c') echo "문자장치입니다.";;
			'b') echo "블록장치입니다.";;
			'p') echo "파이프입니다.";;
			'S') echo "소켓입니다.";;
			'f') echo "보통파일입니다.";;
		esac
		exit 0
	fi
done
