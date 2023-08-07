#! /usr/bin/env zsh
# vim: set fdm=marker:

function switch_dbt_env() {
	if [ "$DBT_ENV" == dev ]; then
		export DBT_ENV=prod
	else
		export DBT_ENV=dev
	fi
}

function switch_dbt_fr() {
	if [ "$DBT_FULL_REFRESH" == true ]; then
		export DBT_FULL_REFRESH=false
	else
		export DBT_FULL_REFRESH=true
	fi
}

function pyclean() {
	find . -type f -name ".python-version" -delete
	find . -type f -name "*.py[co]" -delete
	find . -type d -name "__pycache__" -print -delete
	rm -rf $(find . -type d -name "*venv" -print)
	rm -rf $(find . -type d -name "*.egg-info" -print)
}

function s3_list_keys() {
	local bucket=$1
	local prefix=$2
	aws s3api list-objects-v2 --bucket $bucket --prefix $prefix --query 'Contents[].{Key: Key, LastModified: LastModified}'
}

function mcd() {
	mkdir -p "$1" && cd "$1"
}

function dbt_run() {
	local models=$(fd -e sql | rev | cut -d'/' -f-1 | rev)
  # passing the models list to fzf for selection
  local selected_model=$(echo $models | tr ' ' '\n' | fzf -m)
  # passing the selected models to dbt
  echo $selected_models
}
