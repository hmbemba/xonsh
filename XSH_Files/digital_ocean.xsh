import os
from dotenv import load_dotenv

load_dotenv()

#Env Vars---------------------------------
$do_api_key = os.environ['do_api_key']
$do_key = Path($ssh) / 'do_key' 

# Functions-----------------------------------------
@noArgMsg('You must enter an app name like this : "do_newdb my_app" ')
def _do_newedb(app_name):
    curl -X POST -H "Content-Type: application/json" -H 'Authorization: Bearer $do_api_key' -d f'{{"name":"{app_name[0]}","region":"nyc1","size":"s-1vcpu-1gb","image":"edgedb", "ssh_keys":[36451354]}}' "https://api.digitalocean.com/v2/droplets"

@noArgMsg('You must enter a droplet id like this : "do_deldroplet example_id_1233" \n\nUse "do_alldroplets" command to find droplet ids ')
def _do_deldroplet(droplet_id):
    curl -X DELETE -H "Content-Type: application/json" -H "Authorization: Bearer $do_api_key" f"https://api.digitalocean.com/v2/droplets/{droplet_id[0]}"

@noArgMsg('You must enter the ip address of the app you wish to log in to like so: "do_sshlogin 157.230.53.205"')
def _do_sshlogin(app_ip_addr):
    subprocess.run(['powershell.exe',f'ssh -i {str($do_key)} root@{app_ip_addr[0]}'])

# Aliases----------------------------------
aliases['do_allactions'] = 'curl -X GET "https://api.digitalocean.com/v2/actions" -H "Authorization: Bearer $do_api_key"'
aliases['do_alldroplets'] = 'curl -X GET "https://api.digitalocean.com/v2/droplets" -H "Authorization: Bearer $do_api_key"'
aliases['do_allsshkeys'] = 'curl -X GET "https://api.digitalocean.com/v2/account/keys" -H "Authorization: Bearer $do_api_key"'
aliases['do_allapps'] = 'curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $do_api_key" "https://api.digitalocean.com/v2/apps"'
aliases['do_newedb'] = _do_newedb
aliases['do_deldroplet'] = _do_deldroplet
aliases['do_sshlogin'] = _do_sshlogin
aliases['do_openedbpage'] = 'start https://www.edgedb.com/docs/guides/deployment/digitalocean'
