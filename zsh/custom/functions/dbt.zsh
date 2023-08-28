#! /usr/bin/env zsh
# vim: set fdm=marker:

# ######################
# ## dbt Functions #####
# ######################

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
