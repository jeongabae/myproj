#!/usr/bin/perl
chomp($ip = <STDIN>);
if ($ip =~ /^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/) {
        printf "IP주소형식이 맞습니다.\n";
}
else {
        printf "잘못된 IP주소형식입니다.\n";
}
