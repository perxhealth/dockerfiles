#! /bin/bash
set -e

####################################
###                              ###
###        WARNING !!!!          ###
###                              ###
####################################

### This script will generate a self signed certificate which our
### release will use to sign requests between the load balancer
### and the host on which the release container is running
###
### DO NOT use the key or certificate under any other circumstances!

dim="\e[2m"
reset="\e[0m"
green="\e[32m"
red="\e[31m"

info() {
  printf "${dim}➜ %s${reset}\n" "$(echo "$@" | sed '/./,$!d')"
}
success() {
  printf "${green}✔ %s${reset}\n" "$(echo "$@" | sed '/./,$!d')"
}
error() {
  printf "${red}${bold}✖ %s${reset}\n" "$(echo "$@" | sed '/./,$!d')"
}

if [ -z "$KEY_PATH" ]; then
  error "\"\$KEY_PATH\" must be set"
  exit 1
fi

if [ -z "$CRT_PATH" ]; then
  error "\"\$CRT_PATH\" must be set"
  exit 1
fi

CRT_ORG="Perx Health"
CRT_COUNTRY="AU"
CRT_STATE="NSW"
CRT_LOC="Sydney"
CRT_UNIT="engineering"
CRT_NAME="perx-onboarding"

info "Writing key to: $KEY_PATH"
info "Writing crt to: $CRT_PATH"

info "Generating..."

openssl req -x509 -nodes -days 365 \
  -subj "/C=${CRT_COUNTRY}/ST=${CRT_STATE}/L=${CRT_LOC}/O=${CRT_ORG}/OU=${CRT_UNIT}/CN=${CRT_NAME}" \
  -newkey rsa:4096 -keyout ${KEY_PATH} \
  -out ${CRT_PATH} 2>/dev/null

success "New Certificate Key written to ${KEY_PATH}"
success "New Certificate written to ${CRT_PATH}"
