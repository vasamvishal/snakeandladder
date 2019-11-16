
#!/bin/bash -x
echo "Snake and Ladder game"

#CONSTANT
PLAYER=2
LADDER=1
SNAKE=2
NO_PLAY=0
FINAL_POSITION=5
LAST_POSITION=0
#variable
pos1=0
pos2=0
dice_Count=0
dice_times=0

function diceRolled()
{
	dice_times=$(( RANDOM%6+1 ))
        echo $dice_times
}


function startingGame()
{
  while ! [[ $pos1 -eq $FINAL_POSITION || $pos2 -eq $FINAL_POSITION ]]
	do
		 var=$(diceRolled) 
   	for(( count=1; count<=$PLAYER; count++))
   	do
		if [ $count -eq 1 ]
		then   
                        
        		position1=$( options_for_Position1 $var $pos1 )
                        #position6=$(( $position1 ))
			position1Value $position1 
                        position6=$(( $position1 ))
   		elif [ $count -eq 2 ]
   		then
			dice=$(diceRolled)
   			position2=$( options_for_Position1 $dice $pos2 )
		
   			position1Value $position2
                         position7=$(( $position2 ))
   		#	echo $position2
		fi    
	done
	done
}

function position1Value()
{ 
        position0=$1

	if [ $position0 -gt $FINAL_POSITION ]
	then 
		position0=$(( $position0-$2 ))
               echo $position0

 	elif [ $position0 -eq $FINAL_POSITION ]
	then   
        	position0=$FINAL_POSITION
                echo $position0

        elif [ $position0 -lt $LAST_POSITION ]
        then 
        	position0=$LAST_POSITION
                 echo $position0

	fi
}



#function options_for_Position2()
#{

#	random1=$((RANDOM%3))
#	case $random1 in 
#			  $NO_PLAY )
#		position2=$(($position2+0 ));;
     #        		  $LADDER )
     #   	position2=$(($position2 + $dice_times)) 
     #   	position2Value
    #    	diceRolled
   #     	options_for_Position2 ;;
  #                         $SNAKE )
 #       	position2=$(($position2 - $dice_times));;

#	esac 

#}

function options_for_Position1()
{  
 # echo $1
	random1=$((RANDOM%3))
	case $random1 in 
			$NO_PLAY )
        	position=$(( $position+0 ));;
            		  $LADDER )
        	position=$(($position + $1));;
         #	position1Value
        #	diceRolled
         #	options_for_Position1
              		   $SNAKE )
	  	position=$(($position - $1));;
	esac 
	echo $position
}
startingGame

