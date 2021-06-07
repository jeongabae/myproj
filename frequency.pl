#!/usr/bin/perl
%frequent = ();
chomp($word = <STDIN>);
until ($word eq 'exit') {
        $frequent{$word} += 1;
        chomp($word = <STDIN>);
}
while (($key, $value) = each %frequent) {
        printf "%s는 %d번 입력되었습니다.\n", $key, $value;
}
