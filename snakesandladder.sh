#Welcome to snakes and ladder
position=0;
ladder=1;
noPlay=0;
snake=2;
totalDiePlayed=0;
function die()
{
random=$(( RANDOM%6 ))
totalDiePlayed=$(( $totalDiePlayed+1 ))
}
function play()
{
 random1=$(( RANDOM%3 )) 
 case $random1 in $noPlay )
        position=$(( $position + $random+1 ));;
               $ladder )
        position=$(( $position + $random+1 ));;
               $snake )
        position=$(( $position - $random+1 ));;
 esac
 if [ $position -lt 0 ]
    then
       position=0
 elif [ $position -gt 100 ]
    then 
       position=$(( $position-$random ))
 fi
}

while [ $position -lt 10 ]
do
   die
   play
done
