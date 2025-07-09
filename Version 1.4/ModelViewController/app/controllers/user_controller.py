# app/controllers/user_controller.py
from flask import Blueprint, render_template, request, redirect, url_for, current_app, session
from flask_bcrypt import Bcrypt
from werkzeug.utils import secure_filename
import os


userDb = Blueprint('userDb', __name__ , url_prefix = '/user')

@userDb.route('/dashboard', methods=['GET', 'POST'])
def user_dashboard():
    return render_template('user/userInterface.html')