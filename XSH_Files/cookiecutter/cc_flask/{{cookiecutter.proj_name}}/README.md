# how to use
- should have 5 terminals open
1. watchcss
2. watchjs
3. db_cli
4. main
5. xonsh

# Flask-Login 
- for email based auth 
https://flask-login.readthedocs.io/en/latest/index.html

# Flask-Dance 
- for Oauth

# Flask-wtf & wtforms 

- for forms

# Pony
- With this code each of view function you will define will be wrapped with db_session so you should not care about them.

```
from flask import Flask
from pony.flask import Pony

app = Flask(__name__)
Pony(app)
```
- now you don't have to do this for every view func
```
    @sdb_v3_bp.route('/getbybpm/<bpm>/<plusMinus>')
    @orm.db_session # <- <- <------------------------- NOT NEEDED
    def getByBpm(bpm: int, plusMinus:int = 5):
        ...
        return json.dumps(final, indent=2)

    @sdb_v3_bp.route('/getbykey/<key>')
    @orm.db_session # <- <- <------------------------- NOT NEEDED
    def getByKey(key: str):
        ...
        return Song.getQuery_JSON(query)

    @sdb_v3_bp.route('/addSampleThisTag',methods = ['POST', 'GET'])
    @orm.db_session # <- <- <------------------------- NOT NEEDED
    def addSampleThisTag() -> json:
        songUrl = request.form['url']
        ...
```


# Trip Points
## WTForms
error: 
    Install 'email_validator' for email validation support
solution: 
    ```
    pip install email_validator
    ```
    - WTFOrms needs email_validator
link: 
    https://stackoverflow.com/questions/61356834/wtforms-install-email-validator-for-email-validation-support
