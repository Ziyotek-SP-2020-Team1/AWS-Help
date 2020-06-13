#!/bin/bash
# Name: deleteStack Script
# Creator: Sardorbek Usmonov
# Version: 1.0.0

echo -e "\n\e[32m +---\e[39m Your Acitve Stacks: "
aws cloudformation describe-stacks --query Stacks[*].StackName --output yaml
# Lists the active stacks and only gets the information of stack name

echo ""
read -p $'\e[32m +---\e[39m Give the name of Stack to Delete: ' stackName
aws cloudformation delete-stack --stack-name $stackName 
# Gathers the name of stack user input then sends it to aws to delete the stack

if [[ $(aws cloudformation describe-stacks --query Stacks[0].StackStatus --stack-name $stackName --output text) == *DELETE_IN_PROGRESS* 
    || $(aws cloudformation describe-stacks --query Stacks[0].StackStatus --stack-name $stackName --output text) == *DELETE_COMPLETE* ]]; then
    # Checks if the stack status has Deletion in progress or already been deleted

    echo -e "\n\e[32m +---\e[39m Successfully Deleted the Stack Name \e[32m$stackName\e[39m"

else
    echo -e "\n\e[32m +---\e[39m There has been an error in Process of deletion, Stack Name \e[32m$stackName\e[39m"

fi
# Checks whether deletion has accured or there has been some error in the process, and gives appropriate response 

# Thanks for using my script :D
# I hope you enjoyed it