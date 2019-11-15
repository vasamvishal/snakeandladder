
#!/bin/bash -x
echo "Snake and Ladder game"

#CONSTANT
PLAYER=2
LADDER=1
SNAKE=2
NO_PLAY=0

#variable
position1=0
position2=0
dice_Count=0
dice_times=0

function diceRolled()
{
	dice_times=$(( RANDOM%6+1 ))
}

function playGame()
{
	while ! [[ $position1 -eq 100 || $position2 -eq 100 ]]
	do  
		diceRolled
		startingGame
	done
}


function startingGame()
{
  
	for(( count=1; count<=$PLAYER; count++))
   do
   echo $count
   if [ $count -eq 1 ]
   then
	   options_for_Position1
   	position1Value
   	echo $position1
   elif [ $count -eq 2 ]
   then
		diceRolled
   	options_for_Position2
   	position2Value
   	echo $position2
	fi    
	done
}

function position1Value()
{
	if [ $position1 -gt 100 ]
	then 
		position1=$(( $position1-$dice_times ))
 	elif [ $position1 -eq 100 ]
	then 
      position1=100    
   elif [ $position1 -lt 0 ]
   then 
      position1=0
	fi 
}

function position2Value()
{

	if [ $position2 -gt 100 ]
   then 
      position2=$(($position2-$dice_times))
 	elif [ $position2 -eq 100 ]
   then 
       echo $i "player win"
       position2=100;    
   elif [ $position2 -lt 0 ]
   then 
       position2=0
   fi
}

function options_for_Position2()
{

	random1=$((RANDOM%3))
	case $random1 in  $NO_PLAY )
		position2=$(($position2+0 ));;
             $LADDER )
      position2=$(($position2 + $dice_times)) 
      position2Value
      diceRolled
      options_for_Position2 ;;
              $SNAKE )
      position2=$(($position2 - $dice_times));;
	esac 

}

function options_for_Position1()
{

	random1=$((RANDOM%3))
	case $random1 in $NO_PLAY )
      position1=$(( $position1+0 ));;
            $LADDER )
      position1=$(($position1 + $dice_times))
      position1Value
      diceRolled
      options_for_Position1 ;;
              $SNAKE )
		position1=$(($position1 - $dice_times));;
	esac 

}
playGame

 


