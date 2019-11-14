#Welcome to snakes and ladder
position=0;
ladder=1;
noplay=0;
snake=2;
function die()
{
random=$(( RANDOM%6 ))

}
die
function play()
{
random1=$(( RANDOM%3 )) 

 case $random1 in $noplay )
        position=0;;
               $ladder )
        position=$(( $position + $random ));;
               $snake )
        position=$(( $position + $random ));;
 esac
}
play
