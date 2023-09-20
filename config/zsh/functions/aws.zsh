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

function s3_list_keys() {
    local bucket=$1
    local prefix=$2
    aws s3api list-objects-v2 --bucket $bucket --prefix $prefix --query 'Contents[].{Key: Key, Size: Size}'
}

function s3_list_buckets() {
    aws s3api list-buckets --query 'Buckets[].Name'
}
