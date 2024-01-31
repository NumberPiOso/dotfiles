alias clip='cd /Users/pi/proyects/dbt-models/dbt_models/clip_dashboards'
alias cppcompile='c++ -std=c++11 -stdlib=libc++'
alias men= 'cd "/Users/pi/proyects/men" && source venv/bin/activate'
alias sisc='cd "/Users/pi/proyects/sisc" && export $(xargs < .env)'
alias sterraform='sisc && cd db_sisc_pg/infrastructure'
alias susers='sisc && cd db_sisc_pg/infrastructure-users'
alias argos="cd '/Users/pi/proyects/argos' && conda activate optimization"
# alias hubspot='cd "/Users/pi/proyects/hubspot-analytics" && export $(xargs < .env) && conda activate py311 && poetry shell && cd "dbt_project"'
alias analytics='cd "/Users/pi/proyects/hubspot-analytics" && export $(xargs < .env)'
alias fdbt='analytics && conda activate py311 && cd "dbt_project"'
alias fterraform='analytics && cd infrastructure-airbyte'

alias list_ports="lsof -i -P -n | grep LISTEN"
alias dsa='cd "/Users/pi/proyects/robin/dsa-elt" && conda activate dsa-elt && export $(xargs < .env)'



alias dc='docker-compose'
alias tf='terraform'
alias myip='curl -4 ifconfig.me'

# alias dsa="cd '/Users/pi/proyects/robin/dsa-elt' && export \$(cat .env | xargs) && conda activate dsa-elt"

# alias dsa='cd "/Users/pi/proyects/robin/dsa-elt" && conda activate dsa-elt && export $(xargs < .env) &&  export GOOGLE_APPLICATION_CREDENTIALS="/Users/pablo.osorio/bigquery_cred/dsa-src-cd4dcb45c075.json" && export GOOGLE_APPLICATION_CREDENTIALS_CONTENT=$(cat $GOOGLE_APPLICATION_CREDENTIALS)'
# alias manifest='cd "/Users/pablo.osorio/proyects/robin/dagster-airbyte-dbt" && export $(xargs < .env) && conda activate dagster-airbyte-dbt'
# alias argos='cd "/Users/pablo.osorio/proyects/argos_projects/argos" && conda activate argos'
# alias argos_ui='cd "/Users/pablo.osorio/proyects/argos_projects/data_generation_ui" && source venv/bin/activate'
# alias synthetic='cd "/Users/pablo.osorio/proyects/argos_projects/SyntheticDataCopulas" && source .venv/bin/activate'
# alias dbtstudy='cd "/Users/pablo.osorio/proyects/dbt-tutorial" && conda activate dbt-tutorial && export $(xargs < .env)'
# alias dagster_study='cd "/Users/pablo.osorio/proyects/one-time-proyects/dagster-crash-course/my-dagster-project" && source venv/bin/activate && export $(xargs < .env)' 

function dnames-fn {
	for ID in `docker ps | awk '{print $1}' | grep -v 'CONTAINER'`
	do
    	docker inspect $ID | grep Name | head -1 | awk '{print $2}' | sed 's/,//g' | sed 's%/%%g' | sed 's/"//g'
	done
}

function dip-fn {
    echo "IP addresses of all named running containers"

    for DOC in `dnames-fn`
    do
        IP=`docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}} {{end}}' "$DOC"`
        OUT+=$DOC'\t'$IP'\n'
    done
    echo -e $OUT | column -t
    unset OUT
}