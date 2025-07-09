from flask import Blueprint, render_template, request, redirect, url_for, current_app, session
from flask_bcrypt import Bcrypt
from werkzeug.utils import secure_filename
import os

from app.models.userData_model import fill_user_profile , get_profile

userData = Blueprint('userData',__name__, url_prefix='/data')

@userData.route('/initial-data', methods=['GET', 'POST'])
def initialDataForm():

    connection = current_app.connection
    idUser = session.get('idUser')

    if not idUser:
        return redirect(url_for('userAuth.logIn'))
    
    if request.method == 'GET':
        if get_profile(connection,idUser):
            return redirect(url_for('userDb.user_dashboard'))
        return render_template('user/formInitialData.html')

    if request.method == 'POST':
        idUserSex = request.form['idUserSex']
        profileJobStartTime = request.form['profileJobStartTime']
        profileJobEndTime = request.form['profileJobEndTime']
        profileDailyFreeMinutes = request.form['profileDailyFreeMinutes']
        profileCurrentDiet = request.form['profileCurrentDiet']
        profileDailyFoodsAverage = request.form['profileDailyFoodsAverage']
        profileEstimatedDailyWaterLitres = request.form['profileEstimatedDailyWaterLitres']
        profileSleepTimeAverage = request.form['profileSleepTimeAverage']
        profileCurrentPhysicStatus = request.form['profileCurrentPhysicStatus']
        profileExerciseSessionsFrecuencyWeekly = request.form['profileExerciseSessionsFrecuencyWeekly']
        profileFavoriteExerciseType = request.form['profileFavoriteExerciseType']
        profileScreenTimeAverage = request.form['profileScreenTimeAverage']
        profileStressScale = request.form['profileStressScale']

        fill_user_profile(connection,idUser, idUserSex,profileJobStartTime,profileJobEndTime,profileDailyFreeMinutes,profileCurrentDiet,profileDailyFoodsAverage,profileEstimatedDailyWaterLitres,profileSleepTimeAverage,profileCurrentPhysicStatus,profileExerciseSessionsFrecuencyWeekly,profileFavoriteExerciseType,profileScreenTimeAverage,profileStressScale)
        return redirect(url_for('userDb.user_dashboard'))

    return render_template('user/formInitialData.html')