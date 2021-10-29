#!/bin/bash
#Purge ssh keys
keys=`ibmcloud pi keys | grep "rdr-cicd*" | cut -d' ' -f1`
for key in $keys
do
         ibmcloud pi key-delete "$key"
done

instances="ocp-cicd-london-06 ocp-cicd-toronto-01"

for instance in $instances
do
  #Purge vms
  pvsadm purge vms -n $instance  --regexp "rdr-cicd*" --no-prompt

  #Purge volumes
  pvsadm purge volumes -n $instance  --regexp "rdr-cicd*" --no-prompt

  #Purge networks
  pvsadm purge networks -n $instance  --regexp "rdr-cicd*" --no-prompt
done
