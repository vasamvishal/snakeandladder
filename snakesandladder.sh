#!/bin/bash -x
echo "snake and ladder game"

position1=0
position2=0
player=2
number=0
Ladder=1
snake=2
diceCount=0
noPlay=0

function die()
{
random=$(( RANDOM%6+1 ))
totalDiePlayed=$(( $totalDiePlayed+1 ))
}

function play() {
  
   for(( i=1; i<=$player; i++))
   do
     echo $i
   if [ $i -eq 1 ]
    then

      random1=$((RANDOM%3))  
      case $random1 in  $noPlay )
       position=$(($position1+0 ));;
                       $Ladder )
       position1=$(($position1 + $random));;
                        $snake )
       position1=$(($position1 - $random));;
      esac
      echo $position1
      if [ $position1 -gt 100 ]
      then 
       position1=$(($position1-$random))
      fi
    
      if [ $position1 -eq 100 ]
      then 
       echo $i "player win"
       break
      fi    
    
      if [ $position1 -lt 0 ]
      then 
       position1=0
      fi
           echo "Player 1 played"
           echo "Position played" $position1
    fi
      if [ $i -eq 2 ]
      then
        random=$((RANDOM%6+1))
        random1=$((RANDOM%3))  
        diceCount=$(($diceCount+$random))
        case $random1 in  $noPlay )
         position=$(($position1+0 ));;
                          $Ladder )
         position2=$(($position2 + $random));;
                           $snake )
         position2=$(($position2 - $random));;
        esac
        if [ $position2 -gt 100 ]
        then 
          position2=$(($position2-$random))
        fi
    
        if [ $position2 -eq 100 ]
        then 
         echo $i "player win"
         break
        fi    
    
        if [ $position2 -lt 0 ]
        then 
          position2=0
        fi
       echo "Player 2 play"
       echo "Player2" $position2

      fi
  done
}
 while ! [[ $position1 -eq 100 || $position2 -eq 100 ]]
do
   die
   play
done

echo dice count :$totalDiePlayed

