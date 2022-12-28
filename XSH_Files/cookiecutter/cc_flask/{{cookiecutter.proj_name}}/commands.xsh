# genssl

aliases['genssl'] = 'openssl req -x509 -newkey rsa:4096 -nodes -out cert.pem -keyout key.pem -days 365'
aliases['main'] = 'flask run --reload --cert=cert.pem --key=./key.pem'
aliases['clone_css'] = f'cd {$pwd()}/static ; gh repo clone hmbemba/css ; cd ..'
aliases['clone_porm'] = f'cd {$pwd()}/db ; gh repo clone hmbemba/PonyORM_Wrapper ; cd ..'
aliases['init'] = 'mkvenv ; acvenv ; pip install -r requirements.txt; genssl ; clone_css ; clone_porm'
