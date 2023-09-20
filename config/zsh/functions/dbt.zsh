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

function dbt_ls_models() {
    # check that we are in a dbt project and that target/manifest.json exists
    if [ ! -f target/manifest.json ]; then
        echo "Error: target/manifest.json not found. Are you in a dbt project?"
        return 1
    else
       cat target/manifest.json | jq -r '.nodes[] | select(.resource_type == "model") | .name' | uniq | sort
    fi
}
