#!/usr/bin/perl
open(FILE,"@ARGV");
@line = <FILE>;

@subject = split(/[ ]+/, @line[$0]);
chomp(@subject);
foreach $subjects (@subject){
        print $subjects,"\t"
}
print "총점\t평균\t\n";
$firstline = shift(@line);
chomp($firstline);
$n = scalar(split(/[ ]+/, $firstline))-2;
for($i = 0; $i<$n;$i++){
        @score[$i] = 0;}
$cnt = 0;
foreach $lines (@line){
        $cnt+=1;
        chomp($lines);
        @words = split(/[ ]+/, $lines);
        printf "%d\t%s\t", shift(@words), shift(@words);
        $sum = 0;
        for($i = 0; $i < $n; $i++){
                printf "%d\t",$words[$i];
                $score[$i] += $words[$i];
                $sum += $words[$i];}
        printf "%d\t%.1f\n", $sum, $sum/$n;}
printf "(Avg)\t\t";
foreach $scores (@score){
        printf "%.1f\t", $scores/$cnt;}
printf "\n";
