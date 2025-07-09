use mindset;

/* ----------------------------- */
/* Inserción de registros en tablas principales */
/* ----------------------------- */

/* 1. Inserción en la tabla user */
INSERT INTO user (
  userRole, 
  userFirstName, 
  userSecondName, 
  userFirstLastName, 
  userSecondLastName, 
  userBirthDate, 
  userGender, 
  userEmail, 
  userPassword, 
  userSignUpDate, 
  userSignOutDate, 
  userAccountStatus
)
VALUES (
  'Usuario', 
  'Juan', 
  'Carlos', 
  'Pérez', 
  'Gómez', 
  '1990-01-15', 
  'Masculino', 
  'juan.perez@example.com', 
  'pass1234', 
  '2025-06-23', 
  '2025-06-23 19:24:00', 
  'Activa'
);

/* Suponemos que el usuario insertado recibe idUser = 1 */

/* 2. Inserción en la tabla goal (objetivo) */
/* Nota: Recuerda que previamente agregamos la columna user_idUser */
INSERT INTO goal (
  goalTitle, 
  goalDescription, 
  goalPriority, 
  goalStatus, 
  goalCreationTime, 
  goalLastUpdate, 
  goalStartDate, 
  goalEndDate, 
  goalMotivationNote, 
  user_idUser
)
VALUES (
  'Perder Peso', 
  'Objetivo de perder 5 kg en 3 meses', 
  'Alta', 
  'Activa', 
  '2025-06-23 19:30:00', 
  '2025-06-23 19:30:00', 
  '2025-06-24', 
  '2025-09-24', 
  'Motivado por mejorar la salud', 
  1
);

/* 3. Inserción en la tabla exercise */
INSERT INTO exercise (
  exerciseTitle, 
  exerciseDescription, 
  exerciseCreationTime, 
  exerciseStatus, 
  exerciseLastUpdate, 
  exerciseRecommendedDuration, 
  exerciseIntensityLevel, 
  exerciseSets, 
  exerciseRepetitions, 
  exerciseRequiredEquipment, 
  exerciseMuscularGroup, 
  exerciseBenefits, 
  exerciseMultimediaSupport
)
VALUES (
  'Caminata Rápida', 
  'Caminata en ritmo rápido para mejorar la circulación', 
  '2025-06-23 19:35:00', 
  'Activa', 
  '2025-06-23 19:35:00', 
  30, 
  'Media', 
  1, 
  0, 
  'Ninguno', 
  'Piernas', 
  'Mejora cardiovascular y quema calorías', 
  'video_walk.mp4'
);

/* 4. Inserción en la tabla activePause */
INSERT INTO activePause (
  activePauseTitle, 
  activePauseDescription, 
  activePauseStepToStep, 
  activePauseStatus, 
  activePauseLastUpdate, 
  activePauseCreationTime, 
  activePauseBenefits, 
  activePauseRecommendedDuration, 
  activePauseRecommendedFrecuency
)
VALUES (
  'Pausa Estiramiento', 
  'Realiza estiramientos para reducir la fatiga muscular', 
  '1. Levántate; 2. Estira brazos y piernas; 3. Regresa a tu asiento', 
  'Activa', 
  '2025-06-23 19:40:00', 
  '2025-06-23 19:40:00', 
  'Reduce tensiones y mejora la circulación', 
  5, 
  'Cada 60 minutos'
);

/* 5. Inserción en la tabla diet */
INSERT INTO diet (
  dietTitle, 
  dietDescription, 
  dietGoal, 
  dietStatus, 
  dietCreationDate, 
  dietLastUpdate, 
  dietRecommendedTime, 
  dietIngredientsList, 
  dietBenefits, 
  dietEstimatedCalories, 
  dietProteinPercentage, 
  dietCarbohydratePercentage, 
  dietFatPercentage, 
  dietRestriction
)
VALUES (
  'Dieta Mediterránea', 
  'Plan de alimentación basado en la dieta mediterránea', 
  'Perder peso', 
  'Activa', 
  '2025-06-23 19:45:00', 
  '2025-06-23 19:45:00', 
  'Diaria', 
  'Aceite de oliva, frutas, verduras, pescado', 
  'Mejora la salud cardiovascular y ayuda a perder peso', 
  2000.00, 
  20.00, 
  50.00, 
  30.00, 
  'Sin gluten'
);

/* 6. Inserción en la tabla habit */
INSERT INTO habit (
  habitTitle, 
  habitDescription, 
  habitCreationTime, 
  habitLastUpdate, 
  habitBenefits, 
  habitStatus, 
  habitRecommendedFrecuency, 
  habitRecommendedTime, 
  habitIntensityLevel, 
  habitSuggestedSchedule
)
VALUES (
  'Beber Agua', 
  'Beber 8 vasos de agua al día para mantenerse hidratado', 
  '2025-06-23 19:50:00', 
  '2025-06-23 19:50:00', 
  'Mejora la hidratación y la salud general', 
  'Activa', 
  'Diaria', 
  8, 
  'Media', 
  'Dia'
);

/* 7. Inserción en la tabla personalProgress */
/* Recuerda que hemos agregado la columna user_idUser */
INSERT INTO personalProgress (
  progressPeriodTime, 
  progressStartTime, 
  progressEndTime, 
  progressSummaryAchievements, 
  progressData, 
  progressGraphic, 
  progressGeneralRate, 
  progressCreationDate, 
  progressLastUpdate, 
  progressCongratulationMessage,
  user_idUser
)
VALUES (
  'semanalmente', 
  '2025-06-17 00:00:00', 
  '2025-06-23 23:59:59', 
  'Semana exitosa con buena adhesión a metas', 
  '{"exercises":2, "diets":1, "habits":1}', 
  '{"chartType": "line", "data": [70,80,90]}', 
  85.50, 
  '2025-06-23 20:00:00', 
  '2025-06-23 20:00:00', 
  '¡Buen trabajo!', 
  1
);

/* 8. Inserción en la tabla reminder */
INSERT INTO reminder (
  reminderTitle, 
  reminderDescription, 
  reminderchannel, 
  reminderScheduledTime, 
  reminderFrecuency, 
  reminderStatus, 
  reminderCreationTime, 
  reminderLastUpdate
)
VALUES (
  'Recordatorio de ejercicio', 
  'No olvides hacer tu caminata rápida', 
  'movil', 
  '2025-06-24 07:00:00', 
  'Diaria', 
  'Activa', 
  '2025-06-23 20:05:00', 
  '2025-06-23 20:05:00'
);

/* 9. Inserción en la tabla feedback */
/* Se asume que this feedback se vincula al usuario (id 1) y al seguimiento (id 1) */
INSERT INTO feedback (
  feedbackTitle, 
  feedbackDescription, 
  user_idUser, 
  personalProgress_idPersonalProgress
)
VALUES (
  'Excelente progreso', 
  'Has cumplido con el 85% de tus metas esta semana.', 
  1, 
  1
);

/* 10. Inserción en la tabla userProfile */
/* Recuerda que se agregó la columna user_idUser */
INSERT INTO userProfile (
  profileLastUpdate, 
  profileJobStartTime, 
  profileJobEndTime, 
  profileDailyFreeMinutes, 
  profileCurrentDiet, 
  profileDailyFoodsAverage, 
  profileEstimatedDailyWaterLitres, 
  profileSleepTimeAverage, 
  profileCurrentPhysicStatus, 
  profileExerciseSessionsFrecuencyWeekly, 
  profileFavoriteExerciseType, 
  profileScreenTimeAverage, 
  profileStressScale, 
  profileCurrentHabit,
  user_idUser
)
VALUES (
  '2025-06-23 20:10:00', 
  '09:00:00', 
  '17:00:00', 
  120, 
  'Regular', 
  3, 
  2.50, 
  7.50, 
  'Intermedio', 
  3, 
  'cardio', 
  180, 
  5, 
  'Beber agua', 
  1
);

/* 11. Inserción en la tabla initialDataForm */
/* Asegúrate de que se haya agregado la columna user_idUser */
INSERT INTO initialDataForm (
  formFilledDate, 
  formJobStartTime, 
  formeJobEndTime, 
  formDailyFreeMinutes, 
  formCurrentDiet, 
  formDailyFoodsAverage, 
  formEstimatedDailyWaterLitres, 
  formSleepTimeAverage, 
  formCurrentPhysicStatus, 
  formExerciseSessionsFrecuencyWeekly, 
  formFavoriteExerciseType, 
  formScreenTimeAverage, 
  formStressScale, 
  formCurrentHabit,
  user_idUser
)
VALUES (
  '2025-06-23 20:15:00', 
  '08:30:00', 
  '17:30:00', 
  150, 
  'Perder peso', 
  4, 
  3.00, 
  8.00, 
  'Principiante', 
  2, 
  'fuerza', 
  200, 
  7, 
  'Hacer ejercicio regularmente', 
  1
);

/* ----------------------------- */
/* Inserción en tablas de unión (Relaciones N:N) */
/* ----------------------------- */

/* 12. Relación entre goal y exercise */
INSERT INTO goal_has_exercise (idGoal, idExercise)
VALUES (1, 1);

/* 13. Relación entre goal y diet */
INSERT INTO goal_has_diet (idGoal, idDiet)
VALUES (1, 1);

/* 14. Relación entre goal y activePause */
INSERT INTO goal_has_activePause (idGoal, idActivePause)
VALUES (1, 1);

/* 15. Relación entre goal y habit */
INSERT INTO goal_has_habit (idGoal, idHabit)
VALUES (1, 1);

/* 16. Relación entre habit y exercise */
INSERT INTO habit_has_exercise (idHabit, idExercise)
VALUES (1, 1);

/* 17. Relación entre habit y diet */
INSERT INTO habit_has_diet (idHabit, idDiet)
VALUES (1, 1);

/* 18. Relación entre habit y activePause */
INSERT INTO habit_has_activePause (idHabit, idActivePause)
VALUES (1, 1);

/* 19. Relación entre user y reminder (si se requiere una relación N:N) */
INSERT INTO user_has_reminder (idUser, idReminder)
VALUES (1, 1);

/* (Opcional) Relaciones directas si creaste también las tablas de unión para las actividades asignadas al usuario */
/* Por ejemplo: */
/* Relación entre user y exercise */
INSERT INTO user_has_exercise (user_idUser, idExercise)
VALUES (1, 1);

/* Relación entre user y diet */
INSERT INTO user_has_diet (user_idUser, idDiet)
VALUES (1, 1);

/* Relación entre user y habit */
INSERT INTO user_has_habit (user_idUser, idHabit)
VALUES (1, 1);

/* Relación entre user y activePause */
INSERT INTO user_has_activePause (user_idUser, idActivePause)
VALUES (1, 1);

