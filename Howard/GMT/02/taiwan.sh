psbasemap -Ba1f1/a1f1::EwNs -Jm2 -R119/123/21/26 -G0/250/250 -K -Yc -Xc > report.ps
pscoast -J -B -R -Df -W1 -G250/250/0 -O -K >> report.ps 
echo 121.29 22.83 | psxy -R -J -Sa1 -W0.01 -G255/0/0 -B -K -O >> report.ps
echo 121.16 22.9 12 0 0 CM M:4.6 Depth:5.9km | pstext -J -B -R -O -K>> report.ps
#psxy eq.list -J -B -R -O -Sc0.01 -W0.01 -K >> report.ps

makecpt -T0/315/15 -Crainbow -Z > depth.cpt

awk '{ if ($4<3) print $1, $2, $3}' eq.list |psxy -J -B -R -Sc0.1 -Cdepth.cpt -O -K  >> report.ps
awk '{ if ($4<=4) print $1, $2, $3}' eq.list |psxy -J -B -R -Sc0.1 -Cdepth.cpt -O -K >> report.ps
awk '{ if ($4<=5) print $1, $2, $3}' eq.list |psxy -J -B -R -Sc0.3 -Cdepth.cpt -O -K >> report.ps
awk '{ if ($4>5) print $1, $2, $3}' eq.list |psxy -J -B -R -Sc0.6 -Cdepth.cpt -O >> report.ps
