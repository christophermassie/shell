#! /bin/bash
#makes a directory with the date 


MDATE=`date -d "today" +%Y-%m-%d`
OUTDIR="/tmp/$MDATE/"
OUTFILE="log_${MDATE}_$HOSTNAME.tar"

mkdir /tmp/$MDATE

#Copy information needed for audit

find messages* -mtime -30 -type f -exec cp '{}' $OUTDIR \;
find secure* -mtime -30 -type f -exec cp '{}' $OUTDIR \;
cp /var/log/secure* $OUTDIR
cp /etc/passwd $OUTDIR
cp /etc/group $OUTDIR
cp /etc/sudoers $OUTDIR
cp /etc/ssh/sshd_config $OUTDIR
cp /etc/login.defs $OUTDIR
cp /etc/pam.d/login $OUTDIR

#This will tar the date folder
tar -cvf /tmp/$OUTFILE $OUTDIR
chmod 777 /tmp/$OUTFILE