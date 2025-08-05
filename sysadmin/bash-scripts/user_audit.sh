#!/bin/bash

#Configurations

INACTIVE_DAYS=30
FORMAT=${1:-txt} #txt defect, csv if pass an argument
DATE=$(date +%Y-%m-%d_%H:%M:%S) #Formato -> 2002-10-12_01:15:13
INFORM="Informe_usuarios_$DATE.$FORMAT" # -> 

#Functions 
active_users(){
  echo -e "\nUsuarios activos (Con shell valido):"
  awk -F: '/\/bin\/bash|\/sh|\/bin\/zsh/ {print $1}' /etc/passwd 
 }

nopass_users(){
  echo -e "\nCuentas sin contraseña:"
   awk -F: '($2=="!" || $2=="*" || $2=="") {print $1}' /etc/shadow
}

sudo_users(){
  echo -e "\nUsuarios con priviligios con sudo:"
  getent group sudo | cut -d: -f4 | tr ',' '\n'
}

inactive_users(){
 echo -e "\nCuentas inactivas mas de $INACTIVE_DAYS dias:"
  lastlog | awk -v dias="$INACTIVE_DAYS" ' 
  NR > 1 && $0 !~ /Never/ {
    user = $1
    date = ""
    for (i=4; i<=NF; i++) fecha " " $i
    cmd = "date -d \"" fecha "\" +%s"
    cmd | getline t
    close(cmd)
    diff = (systime() - t)/(60*60*24)
    if (diff > dias) print user ": " int(diff) " dias"
    }'
}

generar_informe() {
  echo "Generando informe en formato $FORMAT..."
  {
    echo "Auditoria de usuarios -$DATE"
    echo "================================"
    echo 
    active_users
    nopass_users
    sudo_users
    inactive_users
  } > "$INFORM"
if [ "$FORMAT" == "csv" ]; then
  INFORME_CSV= "Informe_usuarios_$DATE.csv"
  echo "Tipo, Usuario, Detalle" > "$INFORM_CSV"

  awk -F: '/\/bin\/bash|\/bin\/sh|\/bin\/zsh/ {print "Activo," $1 ",Shell válido"}' /etc/passwd >> "$INFORM_CSV"
  awk -F: '($2=="!" || $2=="*" || $2=="") {print "Sin contraseña," $1 ",Password vacío o bloqueado"}' /etc/shadow >> "$INFORM_CSV"
  getent group sudo | cut -d: -f4 | tr ',' '\n' | awk '{print "Sudo," $1 ",Pertenece al grupo sudo"}' >> "$INFORM_CSV"
  INFORME="$INFORM_CSV"
 fi 

 echo "Informe generado: $INFORM"
}

generar_informe
