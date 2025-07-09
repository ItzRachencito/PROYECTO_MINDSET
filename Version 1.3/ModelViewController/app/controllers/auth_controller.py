# app/controllers/user_controller.py
from flask import Blueprint, render_template, request, redirect, url_for, current_app, session
from flask_bcrypt import Bcrypt
from werkzeug.utils import secure_filename
import os

from app.models.auth_model import create_new_user, get_user_by_email
from app.models.userData_model import get_profile



userAuth = Blueprint('userAuth', __name__ , url_prefix='/auth')
Bcrypt = Bcrypt()

@userAuth.route('/register', methods=['GET', 'POST'])
def register():

    connection = current_app.connection

    if request.method == 'POST':
        userFirstName = request.form['userFirstName']
        userSecondName = request.form['userSecondName']
        userFirstLastName = request.form['userFirstLastName']
        userSecondLastName = request.form['userSecondLastName']
        userBirthDate = request.form['userBirthDate']
        userEmail = request.form['userEmail']   
        userPassword = Bcrypt.generate_password_hash(request.form['userPassword']).decode('utf8') 


        create_new_user(connection,userFirstName,userSecondName,userFirstLastName,userSecondLastName,userBirthDate,userEmail,userPassword)
        return redirect(url_for('userAuth.logIn'))

    return render_template('auth/register.html')




@userAuth.route('/logIn', methods=['GET', 'POST'])
def logIn():

    connection = current_app.connection

    if request.method == 'POST':
        userEmail = request.form['userEmail']
        userPassword = request.form['userPassword']
        user = get_user_by_email(connection, userEmail)

        if not user:
            return render_template('auth/logIn.html' , error = "Usuario no encontrado")
        role_idRole = user['role_idRole']
        storedPassword = user['userPassword']

        if role_idRole == 2:
            valid = Bcrypt.check_password_hash(storedPassword , userPassword)

        elif role_idRole == 1:
            valid = (storedPassword == userPassword)

        else:
            valid = False

        if not valid:
            return render_template ('auth/logIn.html' , error = "Credenciales inválidas")

        session['idUser'] = user ['idUser']
        session['role_idRole'] = role_idRole

        if role_idRole == 1:
                return redirect(url_for('adminDb.dashboard'))

        if get_profile(connection, user['idUser']):
                return redirect(url_for('userDb.user_dashboard'))
            
        return redirect(url_for('userData.initialDataForm'))
        
        
    return render_template('auth/logIn.html')




    






