#makes a directory with the date 

mkdir /tmp/"$(date +"%d-%m-%Y")"


cd /var/log/

#Copy information needed for audit

cp messages* /tmp/"$(date +"%d-%m-%Y")"
cp secure* /tmp/"$(date +"%d-%m-%Y")"
cp /etc/passwd /"$(date +"%d-%m-%Y")"
cp /etc/group /tmp/"$(date +"%d-%m-%Y")"
cp /etc/sudoers /tmp/"$(date +"%d-%m-%Y")"
cp /etc/ssh/sshd_config /tmp/"$(date +"%d-%m-%Y")"
cp /etc/login.defs /tmp/"$(date +"%d-%m-%Y")"
cp /etc/pam.d/login /tmp/"$(date +"%d-%m-%Y")"

#This will tar the date folder
cd /tmp/
tar -cvf log_"$(date +"%d-%m-%Y")".tar /tmp/"$(date +"%d-%m-%Y")"
chmod 777 /tmp/log_"$(date +"%d-%m-%Y")".tar