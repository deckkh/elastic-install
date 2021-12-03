set -e

##### VARS #####
MY_KNOWN_HOSTS=~/.ssh/known_hosts
################

if [ -z "$1" ]
then
    echo "Usage: $0 [path to Ansible inventory]"
    exit 99
fi

# Use Ansible to parse the inventory file to a string of hosts
HOSTS=`ansible all -i $1 --list-hosts  | sed '/hosts.*:/d; s/ //g'`

# Add each host key to known hosts
while read -r line; do
    ssh-keyscan -t ssh-rsa  $line >> $MY_KNOWN_HOSTS
done <<< "$HOSTS"

# Remove duplicates added from the keyscan
sort $MY_KNOWN_HOSTS | uniq > $MY_KNOWN_HOSTS.uniq
mv $MY_KNOWN_HOSTS{.uniq,}
