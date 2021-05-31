#!/bin/sh
if [ $# -eq 0 ] #인자가 없는 경우
then
	echo "usage: $0 argument" 1>&2 #사용법을 표준에러출력으로 출력
	exit 1 #종료코드 1 (실패)
fi

#i=1
sum=0 
for arg in $*
do
	sum=`expr $sum + $arg` #인수 더하기
	#i=`expr $i+1`
done
echo $sum #합 출력
