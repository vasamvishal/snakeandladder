
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
function whil()
{
 while ! [[ $position1 -eq 100 || $position2 -eq 100 ]]
do
   die
   play
done
}

function randomnumber()
{
random1=$((RANDOM%3))
case $random1 in  $noPlay )
position2=$(($position2+0 ));;
                  $Ladder )
echo "Played again for ladder"
position2=$(($position2 + $random))
                       die
                      randomnumber ;;
#position2=$(($position2 + $random));;
                          $snake )
position2=$(($position2 - $random));;
esac 

}

function random()
{
random1=$((RANDOM%3))
case $random1 in  $noPlay )
position1=$(($position1+0 ));;
                  $Ladder )
echo "Played again for ladder"
position1=$(($position1 + $random))
                       die
                      random ;;
                          $snake )
position1=$(($position1 - $random));;
esac 

}


function play() {
  
   for(( i=1; i<=$player; i++))
   do
     echo $i
      if [ $i -eq 1 ]
      then
         random 
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
        die
        randomnumber 
        echo $position2
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
whil
echo dice count :$totalDiePlayed

