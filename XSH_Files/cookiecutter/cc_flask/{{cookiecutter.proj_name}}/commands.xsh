# genssl

aliases['genssl'] = 'openssl req -x509 -newkey rsa:4096 -nodes -out cert.pem -keyout key.pem -days 365'
aliases['main'] = 'flask run --reload --cert=cert.pem --key=./key.pem'
aliases['clone_css'] = f'cd {$pwd()}/static ; gh clone hmbemba/css'
aliases['init'] = 'mkvenv ; acvenv ; pip install -r requirements.txt; genssl ; clone_css'
