#!/bin/bash

echo "Welcome to Arculator"
# Take operands as input
echo "Enter first number to use in the equation: "
read a

echo "Enter second number: "
read b 

# Input type of operation
echo "Enter Arithmetic Operation Choice :"
echo "(1) Addition"
echo "(2) Subtraction"
echo "(3) Multiplication"
echo "(4) Division"
read choice 

# calculator operations
case $choice in
  1)
 result=`echo $a + $b | bc`
  ;;

  2)
 result=`echo $a - $b | bc`
  ;;

  3)
 result=`echo $a \* $b | bc`
  ;;

  4)
 result=`echo "scale=2; $a / $b" | bc`
  ;;
esac

echo "Result: $result"
