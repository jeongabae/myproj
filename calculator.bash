#!/bin/bash
inputs() {
        read -p "Enter two integers: " int1 int2 #두개의 정수를 입력한다.
}
exitPrompt(){
        read -p "Do you wish to continue? [y]es or [n]o: " ans #계속할지 말지에대한 답을 입력
        if [ $ans == 'n' ] # n이라면 
        then
                echo "Exiting the script. Have a nice day!"
                exit 0 # 종료코드 0
        else # n이 아니라면 
                return 0 # 함수를 나와서 계속 함.
        fi
}

while (true)
do
        clear
        printf "Choose from the following operations: \n"
        printf "[a]Addition [b]Subtraction [c] Multiplication [d]Division\n"
        read -p "### Your choice: " choice #무슨 연산을 선택할지 입력하기.
        case $choice in
                [aA]) # a나A가 입력 시
                        inputs #inputs함수 호출
                        res=$((int1+int2)) #두 정수 더해주기
                ;;
                [bB]) # b나 B가 입력 시
                        inputs  #inputs함수 호출
                        res=$((int1-int2)) #두 정수 빼주기
                ;;
                [cC]) # c나 c가 입력 시
                        inputs  #inputs함수 호출
                        res=$((int1*int2)) #두 정수 곱해주기
                ;;
                [dD]) # d나 D가 입력되면
                        inputs  #inputs함수 호출
                        if [ $int2 -eq 0 ]; #두번째 정수가 이라면 즉, 0으로 나누려히먄
                        then
                                echo "Cannot divide by zero" # 0으로 나눌 수 없다고 출력
                                res=0 # 연산결과는 0
                        else # 두번째 정수가 0이 아니라면
                                res=$((int1/int2)) # 두 정수 나눠주기
                        fi
                ;;
                *) # 나머지  입력이 들어오면
                        res=0 # 결과 0으로
                        echo "wrong choice!" # 잘못된 선택이라고 출력
        esac

        echo "The result is: " $res #연산 결과를 출력
        exitPrompt # 종료할지 계속할지 결정해주는 함수를 부른다.
done
