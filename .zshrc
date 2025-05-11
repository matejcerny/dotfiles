export LANG=cs_CZ.UTF-8
export LC_COLLATE=cs_CZ.UTF-8
export LC_CTYPE=cs_CZ.UTF-8
export LC_MESSAGES=cs_CZ.UTF-8
export LC_MONETARY=cs_CZ.UTF-8
export LC_NUMERIC=cs_CZ.UTF-8
export LC_TIME=cs_CZ.UTF-8

CASE_SENSITIVE="true"

# prints wifi ip address
getip () {
	ip=$(ifconfig | grep -v "127.0.0.1" | grep -w inet | awk '{print $2}') 
	echo -n $ip | pbcopy
	echo $ip
}

export GPG_TTY=$(tty)

alias l='lsd -la --group-dirs first'

