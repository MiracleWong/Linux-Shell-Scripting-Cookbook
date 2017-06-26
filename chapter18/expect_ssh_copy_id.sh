#!/bin/bash
PASS=$1
IP=$2
auto_ssh_copy_id(){
  expect -c "set timeout -1;
  spawn /usr/bin/ssh-copy-id -i /root/.ssh/id_rsa.pub ubuntu@$2;
  expect {
    *(yes/no)* {send -- yes\r;exp_continue;}
    *Password:* {send -- $1\r;exp_continue;}
    eof  {exit 0;}
  }";
}
auto_ssh_copy_id $PASS $IP
