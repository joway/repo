#!/usr/bin/env bash
if [ $# -ne 2 ]
then
    echo "Usage : json_to_env.sh path_to_env json_url"
    exit -1
fi
ENV_FILE=$1

curl -sL $2 | awk -F"," '{
    gsub(/{|}/,"")
    print("# -------------Jike ENV-------------")
    for(i=1;i<=NF;i++){
        split($i, arr, /[:]/)
        while( match( arr[1] ,/\"/) > 0) {
               sub( /\"/, "", arr[1])
        }
        printf("export %s=%s\n", arr[1], arr[2])
    }
}' > $ENV_FILE

echo all env into $ENV_FILE
source $ENV_FILE
