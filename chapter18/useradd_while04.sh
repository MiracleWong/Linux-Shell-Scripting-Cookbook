#!/bin/bash
USER_INFO=addusers.txt
USERADD=/usr/sbin/useradd
PASSWD=/usr/bin/passwd
CUT=/bin/cut

while read LINES
do
  USERNAME=`echo $LINES | cut -f1 -d' '`
  PASSWORD=`echo $LINES | cut -f1 -d' '`
  $USERADD $USERNAME
  if [ $? -ne 0]; then
    echo "$USERNAME exists, skip set password"
  else
    echo $PASSWORD | passwd --stdin $USERNAME
  fi
done < $USER_INFO
