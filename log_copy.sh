#! /bin/bash
#makes a directory with the date 


MDATE=`date -d "today" +%Y-%m-%d`
OUTDIR="/tmp/$MDATE/"
OUTFILE="log_${MDATE}_$HOSTNAME.tar"

mkdir /tmp/$MDATE
cd ..
#Copy information needed for audit

cd /var/log/

find . -type f -name "messages*" -ctime -40 -exec cp '{}' $OUTDIR ';' -print
find . -type f -name "secure*" -ctime -40   -exec cp '{}' $OUTDIR ';' -print

cp /etc/passwd $OUTDIR
cp /etc/group $OUTDI
Rcp /etc/sudoers $OUTDIR
cp /etc/ssh/sshd_config $OUTDIR
cp /etc/login.defs $OUTDIR
cp /etc/pam.d/login $OUTDIR

#This will tar the date folder
tar -cvf /tmp/$OUTFILE $OUTDIR
chmod 777 /tmp/$OUTFILE


