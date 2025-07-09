from flask import Blueprint, render_template, current_app, request, redirect, url_for

adminDb = Blueprint('adminDb', __name__, url_prefix='/admin')

@adminDb.route('/dashboard')
def dashboard():
    return render_template('admin/adminInterface.html')

@adminDb.route('/users')
def see_users():

    connection = current_app.connection

    with connection.cursor() as cursor:
        cursor.execute("select user.idUser, user.userFirstName, user.userFirstLastName, user.userEmail, user.userAccountStatus, role.roleName from user join role on user.role_idRole = role.idRole")
        users = cursor.fetchall()

    return render_template('admin/manageUsers/manageMindsetUsers.html', users = users)

