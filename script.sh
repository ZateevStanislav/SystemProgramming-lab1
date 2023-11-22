#!/bin/bash
x=1
echo "Author - Zateev Stanislav. Programm - Enabling and disabling repositories"
while [[ $x == 1 ]]
do
echo "Enabled repositories"
yum repolist enabled
echo "Disabled repositories"
yum repolist disabled
echo "Enter name of repository to change its state"
read rep
res1=$(yum repolist disabled|grep -c -w "${rep} ")
if [[ $res1 == 1 ]]
then
yum-config-manager --enable $rep
else
res2=$(yum repolist enabled|grep -c -w "${rep} ")
if [[ $res2 == 1 ]]
then
yum-config-manager --disable $rep
else
echo "Repository name isn't correct"
fi
fi
echo "Do you want to stop? (y/n)"
read flag
if [[ $flag = y ]]
then
x=0
else
if [[ $flag = n ]]
then
x=1
else
echo "Your answer isn't correct. Please try make circle again"
fi
fi
done
