aliases['genssl'] = 'openssl req -x509 -newkey rsa:4096 -nodes -out cert.pem -keyout key.pem -days 365'
aliases['main'] = 'sanic server:app -p 7777 --debug --workers=2'
aliases['init'] = 'mkvenv ; acvenv ; pip install -r requirements.txt'

# genssl

# aliases['clone_css'] = f'cd {$pwd()}/static ; gh repo clone hmbemba/css'
# aliases['init'] = 'mkvenv ; acvenv ; pip install -r requirements.txt; genssl ; clone_css'
# aliases['clone_porm'] = f'cd {$pwd()}/db ; gh repo clone hmbemba/PonyORM_Wrapper ; cd ..'
