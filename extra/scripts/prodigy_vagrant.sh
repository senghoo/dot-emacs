#! /bin/bash 
declare -i run_terminate=0
trap "run_terminate=1" SIGINT SIGTERM

vagrant up

while [ ${run_terminate} -eq 0 ]
do
    sleep 5
done

vagrant halt

echo "Terminated."
