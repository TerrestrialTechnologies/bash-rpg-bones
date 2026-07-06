#!/bin/bash

player_hp=100
enemy_hp=85
potions=3

clear

echo "======================================================"
echo "                     TERMINAL BATTLE                  "
echo "======================================================"
echo
echo "a rogue sysadmin appears!" 

while [ $player_hp -gt 0 ] && [ $enemy_hp -gt 0 ]
do
echo "_____________________________________________________"
echo  "Your HP: $player_hp"
echo  "Enemy HP: $enemy_hp"
echo  "Potions: $potions"
echo "_____________________________________________________"
echo "1) attack"
echo "2) Heavy attack"
echo "3) Heal"
echo "4) Run"
echo
read -p "choose: " choice

if [ "$choice" = "1" ]; then
damage=$(( Random % 16 + 10 ))
crit=$(( Random % 5 ))

	if [ $crit -eq 0 ]; then 
	   damage=$(( damage * 2 ))
           echo "issa critical hit mang"
        fi

        enemy_hp=$(( enemy_hp - damage ))
        echo "you hit the enemy for $damage damage"

elif [ "$choice" = "2" ]; then 
      hit=$(( RANDOM % 26 + 20 ))
      enemy_hp=$(( enemy_hp - damage ))
	echo "you hit enemy for $damage damage"

elif [ "$choice" = "3" ]; then
     if [ $potions -gt 0 ]; then
	heal=$(( RANDOM % 21 + 20 ))
        player_hp=$(( player_hp + heal))
	potion=$(( potions - 1 ))

	echo "You healed for $heal HP!"
    else
	echo "No potions left!"
   fi
elif [ "choice" = "4" ]; then 
    echo "You escaped!"
    break
else
    echo "Invalid choice"
fi

if [ $enemy_hp -gt 0 ]; then
   enemy_damage=$(( RANDOM % 16 + 5 ))

   player_hp=$(( player_hp - enemy_damage ))

	echo
	echo "enemy hits you for $enemy_damage damage!"
fi

echo
if [ $player_hp -le 0 ]; then
echo "you were defeated"
elif [ $enemy_hp -le 0 ]; then
echo "the enemy is ded"
fi
done
exit
