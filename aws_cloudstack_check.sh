#!/bin/bash
#
# retrieves information about CloudFormation stacks. 
#
set -x
STACK_NAME="my-cloudformation-stack"
aws cloudformation describe-stacks --stack-name $STACK_NAME --query
"Stacks[0].StackStatus"
