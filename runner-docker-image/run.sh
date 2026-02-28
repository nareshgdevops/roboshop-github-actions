if [ -z "${ORG}" ]; then echo imput ORG is missing ; exit 1 ; fi
if [ -z "${TOKEN}" ]; then echo imput TOKEN is missing ; exit 1 ; fi
if [ -z "${NAME}" ]; then echo imput NAME is missing ; exit 1 ; fi
./config.sh --unattended --url ${ORG} --token ${TOKEN} --name ${NAME} --runnergroup default --work _work --replace
./run.sh