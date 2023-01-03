def _installTailwind():
    '''
    This should create a package.json & package-lock.json
    and install tw

    the tailwind.config.js file should already be there from cookiecutter
    '''
    npm init --yes
    npm install -D tailwindcss@latest

def _installAlpine():
    npm install alpinejs
    npm install esbuild

def _opendocs():
    start "https://tailwindcss.com/docs/installation"
    start "https://tailwind-elements.com/quick-start/"
    start "https://alpinejs.dev"
    start "https://www.alpinetoolbox.com"
    start "https://js.hyperui.dev"
    start "https://codepen.io"

aliases['genssl'] = 'openssl req -x509 -newkey rsa:4096 -nodes -out cert.pem -keyout key.pem -days 365'
aliases['clone_porm'] = f'cd {$pwd()}/db ; gh repo clone hmbemba/PonyORM_Wrapper ; cd ..'
aliases['installTailwind'] =_installTailwind
aliases['installAlpine'] =_installAlpine
aliases['gensecret'] = 'import uuid ; print(uuid.uuid4().hex)'

# -> -> -> START HERE <- <- <-
aliases['init'] = 'mkvenv ; acvenv ; pip install -r requirements.txt; genssl ; clone_porm; installTailwind ; installAlpine; gensecret'
# -> -> -> START HERE <- <- <-

aliases['watchcss'] = 'npx tailwindcss -i ./static/src/styles.css -o ./static/public/styles.css --watch'
aliases['watchjs'] = 'npx esbuild ./static/src/_alpine.js --outfile=./static/public/script.js --bundle --watch'
aliases['dbcli'] = 'python db_cli.py'
aliases['main'] = 'flask run --reload --cert=cert.pem --key=./key.pem'


# -> -> -> TODO
# aliases['prod'] = 
# aliases['deployToDocker'] = 
