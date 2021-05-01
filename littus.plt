# Setting  --------------------
reset
set nokey
set term gif animate delay 8 size 854,480
set output 'Littus.gif'
set parametric
set size ratio -1
set samples 1e4
set tics font 'Times New Roman,18'
set xl 'x({/symbol q})' font 'Latin Modern Math, 20'
set yl 'y({/symbol q})' font 'Latin Modern Math, 20'
set xr[-4:12]
set yr[-4:4]
set xtics -4, 2, 12
set ytics -10, 2, 10
set grid

# Function --------------------
a=4.5
x(t) = t<=h ? a*cos(t)/sqrt(t) : 1/0
y(t) = t<=h ? a*sin(t)/sqrt(t) : 1/0
title(i, a, b) = sprintf("x({/symbol q})=Acos{/symbol q}/√{/symbol q}   y({/symbol q})=Asin{/symbol q}/√{/symbol q}\n\n\
A=%.2f  {/symbol q}=%4d °",a, 180/20*i)

# Plot --------------------
n = 15
set tr[0:n*pi]
N = 20*n
do for [i=0:30]{
 set title title(0, a, b) font 'Times New Roman, 20'
 h = pi/20 * 0
 plot x(t), y(t) lw 1 lc 6,\
  x(h), y(h) with points pt 7 ps 1 lc 6
}

do for [i=1:N]{
 set title title(i, a, b) font 'Times New Roman, 20'
 h = pi/20 * i
 plot x(t), y(t) lw 1 lc 6,\
  x(h), y(h) with points pt 7 ps 1 lc 6
}

set out
set terminal wxt enhanced