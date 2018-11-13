#!/bin/bash
# Script to deploy the label bot to our dev account
set -e
BOT_ACCOUNT=""

export AWS_PROFILE=mxnet-ci-dev
aws iam create-role --role-name LabelBotLogAccessRole --assume-role-policy-document file://log-access-trust-policy.json
aws iam create-policy --policy-name LabelBotLogAccessPolicy --policy-document file://log-access-policy.json
aws iam attach-role-policy --policy-arn arn:aws:iam:$(BOT_ACCOUNT):policy/LabelBotLogAccessPolicy --role-name LabelBotLogAccessRole


sls deploy -v
