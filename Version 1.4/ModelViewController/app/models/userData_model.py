def get_profile(connection, idUser):
    with connection.cursor() as cursor:
        cursor.execute(
            "SELECT 1 FROM userProfile WHERE idUser=%s",
            (idUser,)
        )
        return cursor.fetchone()

def fill_user_profile(connection,idUser, idUserSex,profileJobStartTime,profileJobEndTime,profileDailyFreeMinutes,profileCurrentDiet,profileDailyFoodsAverage,profileEstimatedDailyWaterLitres,profileSleepTimeAverage,profileCurrentPhysicStatus,profileExerciseSessionsFrecuencyWeekly,profileFavoriteExerciseType,profileScreenTimeAverage,profileStressScale):
    with connection.cursor() as cursor:
        cursor.execute("insert into userProfile (idUser, idUserSex, profileJobStartTime,profileJobEndTime,profileDailyFreeMinutes,profileCurrentDiet,profileDailyFoodsAverage,profileEstimatedDailyWaterLitres,profileSleepTimeAverage,profileCurrentPhysicStatus,profileExerciseSessionsFrecuencyWeekly,profileFavoriteExerciseType,profileScreenTimeAverage,profileStressScale) values (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)",
        (idUser, idUserSex,profileJobStartTime,profileJobEndTime,profileDailyFreeMinutes,profileCurrentDiet,profileDailyFoodsAverage,profileEstimatedDailyWaterLitres,profileSleepTimeAverage,profileCurrentPhysicStatus,profileExerciseSessionsFrecuencyWeekly,profileFavoriteExerciseType,profileScreenTimeAverage,profileStressScale)
        )
        connection.commit()