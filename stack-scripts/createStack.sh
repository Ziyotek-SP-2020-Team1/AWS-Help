#!/bin/bash
# Name: createStack Script
# Creator: Sardorbek Usmonov
# Version: 2.0.0

# VARIABLE
fileLocation="~/cloudformation/parameters.yml"

# Give Stack Name
read -p $'\e[32m +---\e[39m Give Name to your Stack: ' stackName

# Validate Template Before Creation
aws cloudformation validate-template --template-body file://$fileLocation
if [ $? -le 1 ]; then
# Checks If aws validation command ran successfully or not

    if [[ $(aws cloudformation describe-stacks --query Stacks[*].StackName --output text) == $stackName ]]; then
        echo -e "\n\e[32m +---\e[39m Stack Name \e[32m$stackName\e[39m already exists, Please give new Stack Name \n"
        exec bash "$0" "$@"
        # Checks If Stack Name was already used or not, If similar Stack Name is present then re runs this script from begining 

    else 
        echo -e "\n\e[32m +---\e[39m Stack Name \e[32m$stackName\e[39m is being Created \n"
        aws cloudformation create-stack --stack-name $stackName --template-body file://$fileLocation
        echo -e "\n\e[32m              Time                    Resource              Status \e[39m"
        aws cloudformation describe-stack-events --query "StackEvents[0].[Timestamp,LogicalResourceId,ResourceStatus]" --stack-name $stackName --output text
        # Initates the creation process of the stack

        until [[ $(aws cloudformation describe-stack-events --query "StackEvents[0].[ResourceStatus,LogicalResourceId]" --stack-name $stackName --output text) == *CREATE_COMPLETE**$stackName* 
            || $(aws cloudformation describe-stack-events --query "StackEvents[0].[ResourceStatus,LogicalResourceId]" --stack-name $stackName --output text) == *ROLLBACK_COMPLETE**$stackName* ]];
            # Checks if stack has completed the its creation or has failed in the process
        do 
            aws cloudformation describe-stack-events --query "StackEvents[0].[Timestamp,LogicalResourceId,ResourceStatus]" --stack-name $stackName --output text
            # Retrives Time, LogicalID, and Status of the stack

        done
        # Command keeps running in the loop until above conditions are true

        if [[ $(aws cloudformation describe-stack-events --query "StackEvents[0].[ResourceStatus,LogicalResourceId]" --stack-name $stackName --output text) == *CREATE_COMPLETE**$stackName* ]]; then
            aws cloudformation describe-stack-events --query "StackEvents[0].[Timestamp,LogicalResourceId,ResourceStatus]" --stack-name $stackName --output text
            echo -e "\n\e[32m +---\e[39m Stack Name \e[32m$stackName\e[39m was created Successfully!"
            exit
            # When until loop finished, checks if stack status completed Succesfully or not, If so then echo's congratulations and ends the script 

        fi

        if [[ $(aws cloudformation describe-stack-events --query "StackEvents[0].[ResourceStatus,LogicalResourceId]" --stack-name $stackName --output text) == *ROLLBACK_COMPLETE**$stackName* ]]; then
            aws cloudformation describe-stack-events --query "StackEvents[0].[Timestamp,LogicalResourceId,ResourceStatus]" --stack-name $stackName --output text
            echo -e "\n\e[32m +---\e[39m Stack Name \e[32m$stackName\e[39m has FAILED to create, Please check for errors down below"
            echo -e "\n\e[32m +---\e[39m This LogicalId Resource that caused an error"
            aws cloudformation describe-stack-events --query "StackEvents[?ResourceStatus =='CREATE_FAILED'].LogicalResourceId  " --stack-name $stackName --output yaml
            echo -e "\n\e[32m +---\e[39m This is in detail describtion of an error"
            aws cloudformation describe-stack-events --query "StackEvents[?ResourceStatus =='CREATE_FAILED'].ResourceStatusReason " --stack-name $stackName --output yaml
            exit
             # When until loop finished, checks if stack status Failed or not, If so then echo's that is has failed and display's which LogicalId failed and what went wrong

        fi
    fi
else
    echo -e "\n\e[32m +---\e[39m There is a Error in your template, Please Fix it"
    exit
    # Displays error if Validation command didn't run successfully

fi 

# Thanks for using my script :D
# I hope you enjoyed it
