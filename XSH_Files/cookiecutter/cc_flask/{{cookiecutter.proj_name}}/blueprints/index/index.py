from flask import Blueprint, render_template
from flask_login import login_required, current_user


index_bp = Blueprint('index_bp', __name__)

@index_bp.route('/')
@login_required
def index():
    #return "Hi! " + current_user.username
    context  = {
        
    }
    return render_template('pages/index.html', **context)








