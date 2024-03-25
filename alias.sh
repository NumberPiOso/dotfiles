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
alias dsa='cd "/Users/pi/proyects/robin/dsa-elt" && conda activate dsa-elt && export $(xargs < .env)'


alias list_ports="lsof -i -P -n | grep LISTEN"
alias dc='docker-compose'
alias tf='terraform'
alias myip='curl -4 ifconfig.me'
alias ghcs="gh copilot suggest"
alias ghce="gh copilot explain"

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

