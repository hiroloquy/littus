reset
set angle radians

#=================== Parameter ====================
a = 4.5     # Coefficient of lituus
k = 15      # 0 ≦ θ ≦ k*pi [rad]
n = 20      # Resolution
N = n * k

#=================== Function ====================
# Curve
x(t) = (t>0 ? a*cos(t)/sqrt(t) : 1/0)
y(t) = (t>0 ? a*sin(t)/sqrt(t) : 1/0)

# Title
title(a, theta) = sprintf("{/:Italic x}({/:Italic θ})={/:Italic A}cos{/:Italic θ}/√{/:Italic θ}   \
{/:Italic y}({/:Italic θ})={/:Italic A}sin{/:Italic θ}/√{/:Italic θ}\n\n\
{/:Italic A}=%.2f  {/:Italic θ}=%d°",a, theta)

#=================== Plot ====================
set nokey
set term gif animate delay 5 size 900, 480 font 'Times New Roman, 20'
set output 'lituus.gif'

set parametric
set size ratio -1
set samples 1e4
set tics font ', 16'
set xlabel '{/:Italic x}'
set ylabel '{/:Italic y}'
set xrange [-4:12]
set yrange [-4:4]
set xtics 2
set ytics 2
set grid

# Stop animation for 30 frames
do for [i=1:30] {
  set title title(a, 0)
  h = pi/n * 0
  set trange [0:h]
  plot x(t), y(t) lw 1 lc 6, x(h), y(h) with points pt 7 ps 1 lc 6
}

# Update animation for N frames
do for [i=1:N] {
  set title title(a, 180/n * i) # [deg]
  h = pi/n * i                  # [rad]
  set trange [0:h]
  plot x(t), y(t) lw 1 lc 6, x(h), y(h) with points pt 7 ps 1 lc 6
}

set out