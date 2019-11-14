#Welcome to snakes and ladder
position=0;
ladder=1;
noplay=0;
snake=2;
allPosition=0;
totaldie=0;
function die()
{
random=$(( RANDOM%6 ))
totaldie=$(( $totaldie+$random ))
}
function play()
{
random1=$(( RANDOM%3 )) 

 case $random1 in $noplay )
        position=$(( $position + 0 ));;
               $ladder )
        position=$(( $position + $random ));;
               $snake )
        position=$(( $position - $random ));;
           
 esac
 if [ $position -lt 0 ]
    then
       position=0
 elif [ $position -gt 100 ]
    then 
       position=$(( $position-$random ))
 fi
}

while [ $position -lt 100 ]
do
   die
   play
done
