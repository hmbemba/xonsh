from flask import redirect, url_for
from flask_dance.contrib.google import google
from oauthlib.oauth2.rfc6749.errors import TokenExpiredError
from db.models.auth.UserModel import User

def google_auth():
    try:
        if not google.authorized:
            return redirect(url_for("google.login"))
        resp = google.get("/oauth2/v1/userinfo")
        assert resp.ok, resp.text
        return resp.json() 
    except TokenExpiredError:
        return "your ouathlib token expired bro!"
    except Exception as e:
        return str(e)

