Y=$(date +%Y)
M=$(date +%m)
D=$(date +%d)
Hr=$(date +%H)
Mn=$(date +%M)
Sc=$(date +%S)
 
#Ym=$Y-$M
Ymd=$Y-$M-$D
YmdHMS=$Y-$M-$D--$Hr:$Mn:$Sc
 
HomeDir="/home/aster1sk"
GitDir="$HomeDir/Seoul-Server-Status-log"
FileDir="$HomeDir/Seoul-Server-Status-log/$Ymd"
Diskuplog="$YmdHMS"-log.txt
 
mkdir -p $FileDir
 
echo "### $YmdHMS Status" >> $FileDir/$Diskuplog
echo -----UPTIME----- >> $FileDir/$Diskuplog
uptime >> $FileDir/$Diskuplog
echo -----DISK LOG----- >> $FileDir/$Diskuplog
df -h >> $FileDir/$Diskuplog
 
cd $GitDir
git add .
git commit -m "commit $Diskuplog"
git push origin master