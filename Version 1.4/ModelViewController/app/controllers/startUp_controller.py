# app/controllers/main_controller.py
from flask import Blueprint, render_template

startUp = Blueprint('startUp', __name__)

@startUp.route('/')
def home():
    return render_template('home.html')

