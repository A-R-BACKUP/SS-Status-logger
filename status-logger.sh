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

echo "---------- $YmdHMS Status ----------" >> $FileDir/$Diskuplog
echo "   " >> $FileDir/$Diskuplog
echo "   " >> $FileDir/$Diskuplog
echo "----- SPEC -----" >> $FileDir/$Diskuplog
neofetch | grep -o aster1sk.* | sed 's/\x1B\[[0-9;]\{1,\}[A-Za-z]//g' >> $FileDir/$Diskuplog
neofetch | grep -o OS.* | sed 's/\x1B\[[0-9;]\{1,\}[A-Za-z]//g' >> $FileDir/$Diskuplog
neofetch | grep -o Host.* | sed 's/\x1B\[[0-9;]\{1,\}[A-Za-z]//g' >> $FileDir/$Diskuplog
neofetch | grep -o Kernel.* | sed 's/\x1B\[[0-9;]\{1,\}[A-Za-z]//g' >> $FileDir/$Diskuplog
neofetch | grep -o Uptime.* | sed 's/\x1B\[[0-9;]\{1,\}[A-Za-z]//g' >> $FileDir/$Diskuplog
neofetch | grep -o Packages.* | sed 's/\x1B\[[0-9;]\{1,\}[A-Za-z]//g' >> $FileDir/$Diskuplog
neofetch | grep -o Shell.* | sed 's/\x1B\[[0-9;]\{1,\}[A-Za-z]//g' >> $FileDir/$Diskuplog
neofetch | grep -o Terminal.* | sed 's/\x1B\[[0-9;]\{1,\}[A-Za-z]//g' >> $FileDir/$Diskuplog
neofetch | grep -o CPU.* | sed 's/\x1B\[[0-9;]\{1,\}[A-Za-z]//g' >> $FileDir/$Diskuplog
neofetch | grep -o GPU.* | sed 's/\x1B\[[0-9;]\{1,\}[A-Za-z]//g' >> $FileDir/$Diskuplog
neofetch | grep -o Memory.* | sed 's/\x1B\[[0-9;]\{1,\}[A-Za-z]//g' >> $FileDir/$Diskuplog
echo "   " >> $FileDir/$Diskuplog
echo "   " >> $FileDir/$Diskuplog


echo "----- UPTIME -----" >> $FileDir/$Diskuplog
uptime >> $FileDir/$Diskuplog
echo "   " >> $FileDir/$Diskuplog
echo "   " >> $FileDir/$Diskuplog

echo "----- Storage Status -----" >> $FileDir/$Diskuplog
df -h >> $FileDir/$Diskuplog
echo "   " >> $FileDir/$Diskuplog
echo "   " >> $FileDir/$Diskuplog

echo "----- ps -ef -----" >> $FileDir/$Diskuplog
ps -ef >> $FileDir/$Diskuplog
echo "   " >> $FileDir/$Diskuplog
echo "   " >> $FileDir/$Diskuplog

cd $GitDir
git add .
git commit -m "commit $Diskuplog"
git push origin master
