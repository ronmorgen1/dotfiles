#! /usr/bin/env zsh
# vim: set fdm=marker:

# ######################
# ## AWS Functions #####
# ######################

function switch_aws_profile() {
    if [ "$AWS_PROFILE" == Eng-Prod ]; then
        export AWS_PROFILE=Eng-Dev
    else
        export AWS_PROFILE=Eng-Prod
    fi
}

function s3_ls() {
    local bucket=$1
    local prefix=$2
    aws s3api list-objects-v2 --bucket $bucket --prefix $prefix --query 'Contents[].{Key: Key, Size: Size}'
}

