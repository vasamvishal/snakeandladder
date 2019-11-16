
#!/bin/bash -x
echo "Snake and Ladder game"

#CONSTANT
PLAYER=2
LADDER=1
SNAKE=2
NO_PLAY=0
FINAL_POSITION=100
LAST_POSITION=0
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
	while ! [[ $position1 -eq $FINAL_POSITION || $position2 -eq $FINAL_POSITION ]]
	do  
	  diceRolled
	  startingGame
	done
}


function startingGame()
{
  
   	for(( count=1; count<=$PLAYER; count++))
   	do
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
	if [ $position1 -gt $FINAL_POSITION ]
	then 
	    position1=$(( $position1-$dice_times ))
 	elif [ $position1 -eq $FINAL_POSITION ]
	then 
            position1=$FINAL_POSITION
        elif [ $position1 -lt $LAST_POSITION ]
        then 
            position1=$LAST_POSITION
	fi 
}

function position2Value()
{

	if [ $position2 -gt $FINAL_POSITION ]
	then 
	    position2=$(($position2-$dice_times))
 	elif [ $position2 -eq $FINAL_POSITION ]
   	then 
            echo $i "player win"
        position2=$FINAL_POSITION;    
        elif [ $position2 -lt $LAST_POSITION ]
        then 
            position2=$LAST_POSITION
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
