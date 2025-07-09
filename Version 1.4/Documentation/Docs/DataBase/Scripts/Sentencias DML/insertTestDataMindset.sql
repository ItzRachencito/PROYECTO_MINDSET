use mindsetQueries;


INSERT INTO user (
  role_idRole, userFirstName, userSecondName,
  userFirstLastName, userSecondLastName,
  userBirthDate, userEmail, userPassword
) VALUES
  (
    (SELECT idRole FROM role WHERE roleName = 'Usuario'),
    'Juan', 'Carlos',
    'Pérez', 'Gómez',
    '1990-05-12', 'juan.perez@example.com', 'Pass123!'
  ),
  (
    (SELECT idRole FROM role WHERE roleName = 'Usuario'),
    'María', NULL,
    'Rodríguez', 'López',
    '1985-11-23', 'maria.rodriguez@example.com', 'Clave456!'
  ),
  (
    (SELECT idRole FROM role WHERE roleName = 'Usuario'),
    'Alejandro', 'Andrés',
    'Toro', NULL,
    '1992-07-08', 'alejandro.toro@example.com', 'Secreta789!'
  );
  
  INSERT INTO userProfile (
  idUser, idUserSex,
  profileJobStartTime, profileJobEndTime,
  profileDailyFreeMinutes, profileCurrentDiet,
  profileDailyFoodsAverage, profileEstimatedDailyWaterLitres,
  profileSleepTimeAverage, profileCurrentPhysicStatus,
  profileExerciseSessionsFrecuencyWeekly,
  profileFavoriteExerciseType, profileScreenTimeAverage,
  profileStressScale
) VALUES
  (
    (SELECT idUser FROM user WHERE userEmail = 'juan.perez@example.com'),
    (SELECT idUserSex FROM userSex WHERE userSexName = 'Masculino'),
    '08:00:00', '17:00:00',
    120, 'Regular',
    3, 2.50,
    7.50, 'Intermedio',
    4, 'Cardio',
    180, 3
  ),
  (
    (SELECT idUser FROM user WHERE userEmail = 'maria.rodriguez@example.com'),
    (SELECT idUserSex FROM userSex WHERE userSexName = 'Femenino'),
    '09:00:00', '18:00:00',
    90, 'Perder peso',
    4, 2.00,
    6.50, 'Avanzado',
    5, 'Fuerza',
    200, 2
  ),
  (
    (SELECT idUser FROM user WHERE userEmail = 'alejandro.toro@example.com'),
    (SELECT idUserSex FROM userSex WHERE userSexName = 'Otro'),
    '07:30:00', '16:30:00',
    150, 'Ganar peso',
    5, 3.00,
    8.00, 'Principiante',
    3, 'Relajación',
    240, 4
  );
  
  INSERT INTO personalProgress (
  profile_idUser, progressPeriodTime,
  progressStartTime, progressEndTime,
  progressSummaryAchievements, progressData,
  progressGraphic, progressGeneralRate,
  progressCreationDate, progressLastUpdate,
  progressCongratulationMessage
) VALUES
  (
    (SELECT idUser FROM user WHERE userEmail = 'juan.perez@example.com'),
    'mensualmente',
    '2025-06-01 00:00:00', '2025-06-30 23:59:59',
    'Completó 3 metas de cardio y redujo 2 kg',
    '{"pesoInicio":78,"pesoFin":76}', 'grafico_junio.png',
    8.75,
    NOW(), NOW(),
    '¡Excelente progreso, Juan!'
  ),
  (
    (SELECT idUser FROM user WHERE userEmail = 'maria.rodriguez@example.com'),
    'mensualmente',
    '2025-06-01 00:00:00', '2025-06-30 23:59:59',
    'Aumentó fuerza en 5%', '{"fuerzaInicial":50,"fuerzaFinal":52}',
    'grafico_fuerza_junio.png',
    9.20,
    NOW(), NOW(),
    'Sigue así, María!'
  ),
  (
    (SELECT idUser FROM user WHERE userEmail = 'alejandro.toro@example.com'),
    'mensualmente',
    '2025-06-01 00:00:00', '2025-06-30 23:59:59',
    'Implementó hábitos de relajación diarios', '{"sesionesRelaj":20}',
    'grafico_relajacion_junio.png',
    7.50,
    NOW(), NOW(),
    'Buen comienzo, Alejandro!'
  );
  
  
 -- Metas de Juan
INSERT INTO goal (
  user_idUser, goalTitle, goalDescription,
  goalPriority, goalStatus, goalCreationTime,
  goalLastUpdate, goalStartDate, goalEndDate,
  goalMotivationNote
) VALUES
  (
    (SELECT idUser FROM user WHERE userEmail = 'juan.perez@example.com'),
    'Correr 20 km/semana', 'Mejorar resistencia cardiovascular',
    'Alta', 'Activa', NOW(), NOW(),
    '2025-07-01','2025-07-31','Quiero sentirme más enérgico'
  ),
  (
    (SELECT idUser FROM user WHERE userEmail = 'juan.perez@example.com'),
    'Reducir 5% grasa corporal', 'Perder peso de la zona abdominal',
    'Media', 'Activa', NOW(), NOW(),
    '2025-07-01','2025-09-01','Ver abdominales definidos'
  );

-- Metas de María
INSERT INTO goal (
  user_idUser, goalTitle, goalDescription,
  goalPriority, goalStatus, goalCreationTime,
  goalLastUpdate, goalStartDate, goalEndDate,
  goalMotivationNote
) VALUES
  (
    (SELECT idUser FROM user WHERE userEmail = 'maria.rodriguez@example.com'),
    'Sentadillas con 60kg', 'Aumentar fuerza de piernas',
    'Alta', 'Activa', NOW(), NOW(),
    '2025-07-01','2025-08-15','Entrar en circuito de pesas'
  ),
  (
    (SELECT idUser FROM user WHERE userEmail = 'maria.rodriguez@example.com'),
    'Mejorar flexibilidad', 'Hacer splits completos',
    'Baja', 'Activa', NOW(), NOW(),
    '2025-07-01','2025-10-01','Poder tocar punta de pie'
  );

-- Metas de Alejandro
INSERT INTO goal (
  user_idUser, goalTitle, goalDescription,
  goalPriority, goalStatus, goalCreationTime,
  goalLastUpdate, goalStartDate, goalEndDate,
  goalMotivationNote
) VALUES
  (
    (SELECT idUser FROM user WHERE userEmail = 'alejandro.toro@example.com'),
    'Meditar 10 min diarios', 'Reducir estrés y ansiedad',
    'Alta', 'Activa', NOW(), NOW(),
    '2025-07-01','2025-12-31','Mantenerme centrado'
  ),
  (
    (SELECT idUser FROM user WHERE userEmail = 'alejandro.toro@example.com'),
    'Dormir 8 horas', 'Mejorar calidad de sueño',
    'Media', 'Activa', NOW(), NOW(),
    '2025-07-01','2025-07-31','Sentirme descansado'
  );
  

-- Juan --

INSERT INTO diet (
  goal_idGoal, dietTitle, dietDescription,
  dietStatus, dietCreationDate, dietLastUpdate,
  dietRecommendedTime, dietIngredientsList,
  dietBenefits, dietEstimatedCalories,
  dietProteinPercentage, dietCarbohydratePercentage,
  dietFatPercentage, dietRestriction
) VALUES
  (
    (SELECT idGoal FROM goal 
     WHERE user_idUser = (SELECT idUser FROM user WHERE userEmail='juan.perez@example.com')
       AND goalTitle = 'Correr 20 km/semana'),
    'Dieta alta en carbohidratos',
    'Foco en pasta, arroz integral y frutas',
    'Activa', NOW(), NOW(),
    'Antes de entrenar',
    'Pasta, arroz integral, plátano, avena',
    'Energía sostenida', 2500, 15.00, 65.00, 20.00, 'Sin fritos'
  );

-- Ejercicio para esa misma meta
INSERT INTO exercise (
  goal_idGoal, exerciseTitle, exerciseDescription,
  exerciseCreationTime, exerciseLastUpdate,
  exerciseStatus, exerciseRecommendedDuration,
  exerciseIntensityLevel, exerciseSets,
  exerciseRepetitions, exerciseRequiredEquipment,
  exerciseMuscularGroup, exerciseBenefits,
  exerciseMultimediaSupport
) VALUES
  (
    (SELECT idGoal FROM goal 
     WHERE user_idUser = (SELECT idUser FROM user WHERE userEmail='juan.perez@example.com')
       AND goalTitle = 'Correr 20 km/semana'),
    'Trote continuo',
    'Correr a ritmo constante 5 km',
    NOW(), NOW(), 'Activa',
    30, 'Media', 1, 1,
    'Zapatillas', 'Piernas', 'Mejora resistencia',
    'video_trote.mp4'
  );

-- Pausa activa para esa meta
INSERT INTO activePause (
  goal_idGoal, activePauseTitle, activePauseDescription,
  activePauseStepToStep, activePauseStatus,
  activePauseCreationTime, activePauseLastUpdate,
  activePauseBenefits, activePauseRecommendedDuration,
  activePauseRecommendedFrecuency
) VALUES
  (
    (SELECT idGoal FROM goal 
     WHERE user_idUser = (SELECT idUser FROM user WHERE userEmail='juan.perez@example.com')
       AND goalTitle = 'Correr 20 km/semana'),
    'Estiramientos de piernas',
    'Series de estiramiento para cuádriceps e isquios',
    '1. Pies juntos… 2. Flexionar rodilla…',
    'Activa', NOW(), NOW(),
    'Previene lesiones', 5, 'Antes de correr'
  );

-- Hábito para esa meta
INSERT INTO habit (
  goal_idGoal, habitTitle, habitDescription,
  habitCreationTime, habitLastUpdate,
  habitBenefits, habitStatus,
  habitRecommendedFrecuency, habitRecommendedTime,
  habitIntensityLevel, habitSuggestedSchedule
) VALUES
  (
    (SELECT idGoal FROM goal 
     WHERE user_idUser = (SELECT idUser FROM user WHERE userEmail='juan.perez@example.com')
       AND goalTitle = 'Correr 20 km/semana'),
    'Beber 500ml agua antes de entrenar',
    'Aumenta hidratación y rendimiento',
    NOW(), NOW(), 'Mejora resistencia',
    'Activa', 'Diaria', 10, 'Baja', 'Mañana'
  );
  
-- Recordatorios y feedback para Juan
INSERT INTO reminder (
  personalProgress_id, reminderTitle, reminderDescription,
  reminderChannel, reminderScheduledTime,
  reminderFrecuency, reminderStatus,
  reminderCreationTime, reminderLastUpdate
) VALUES
  (
    (SELECT idPersonalProgress FROM personalProgress
     WHERE profile_idUser = (SELECT idUser FROM user WHERE userEmail='juan.perez@example.com')),
    'Sesión de trote', 'No olvides tu trote de hoy',
    'movil', '2025-07-01 07:00:00',
    'Diaria', 'Activa', NOW(), NOW()
  ),
  (
    (SELECT idPersonalProgress FROM personalProgress
     WHERE profile_idUser = (SELECT idUser FROM user WHERE userEmail='juan.perez@example.com')),
    'Estiramiento', 'Completa tus estiramientos',
    'email', '2025-07-01 06:55:00',
    'Diaria', 'Activa', NOW(), NOW()
  );

INSERT INTO feedback (
  personalProgress_id, feedbackTitle, feedbackDescription
) VALUES
  (
    (SELECT idPersonalProgress FROM personalProgress
     WHERE profile_idUser = (SELECT idUser FROM user WHERE userEmail='juan.perez@example.com')),
    '¡Buen ritmo!', 'Has mantenido un buen ritmo de trote esta semana.'
  );
  
  
-- Maria --

INSERT INTO diet (
  goal_idGoal, dietTitle, dietDescription,
  dietStatus, dietCreationDate, dietLastUpdate,
  dietRecommendedTime, dietIngredientsList,
  dietBenefits, dietEstimatedCalories,
  dietProteinPercentage, dietCarbohydratePercentage,
  dietFatPercentage, dietRestriction
) VALUES (
  (SELECT idGoal FROM goal 
     WHERE user_idUser = (SELECT idUser FROM user WHERE userEmail='maria.rodriguez@example.com')
       AND goalTitle = 'Sentadillas con 60kg'),
  'Dieta alta en proteínas',
  'Enfocada en carnes magras, huevos y legumbres',
  'Activa', NOW(), NOW(),
  'Después de entrenar',
  'Pechuga de pollo, claras de huevo, lentejas',
  'Reparación muscular', 2000, 30.00, 40.00, 30.00,
  'Sin azúcares añadidos'
);

INSERT INTO exercise (
  goal_idGoal, exerciseTitle, exerciseDescription,
  exerciseCreationTime, exerciseLastUpdate,
  exerciseStatus, exerciseRecommendedDuration,
  exerciseIntensityLevel, exerciseSets,
  exerciseRepetitions, exerciseRequiredEquipment,
  exerciseMuscularGroup, exerciseBenefits,
  exerciseMultimediaSupport
) VALUES (
  (SELECT idGoal FROM goal 
     WHERE user_idUser = (SELECT idUser FROM user WHERE userEmail='maria.rodriguez@example.com')
       AND goalTitle = 'Sentadillas con 60kg'),
  'Sentadillas con barra',
  '3 series de 8 repeticiones a 60kg',
  NOW(), NOW(), 'Activa',
  20, 'Alta', 3, 8,
  'Barra y rack', 'Piernas',
  'Fortalece cuádriceps e isquios',
  'video_sentadillas.mp4'
);

INSERT INTO activePause (
  goal_idGoal, activePauseTitle, activePauseDescription,
  activePauseStepToStep, activePauseStatus,
  activePauseCreationTime, activePauseLastUpdate,
  activePauseBenefits, activePauseRecommendedDuration,
  activePauseRecommendedFrecuency
) VALUES (
  (SELECT idGoal FROM goal 
     WHERE user_idUser = (SELECT idUser FROM user WHERE userEmail='maria.rodriguez@example.com')
       AND goalTitle = 'Sentadillas con 60kg'),
  'Descanso activo piernas',
  'Movilidad de cadera y tobillo entre series',
  '1. Rotar cadera… 2. Balanceo de tobillo…',
  'Activa', NOW(), NOW(),
  'Mejora rango de movimiento', 4, 'Entre series'
);

INSERT INTO habit (
  goal_idGoal, habitTitle, habitDescription,
  habitCreationTime, habitLastUpdate,
  habitBenefits, habitStatus,
  habitRecommendedFrecuency, habitRecommendedTime,
  habitIntensityLevel, habitSuggestedSchedule
) VALUES (
  (SELECT idGoal FROM goal 
     WHERE user_idUser = (SELECT idUser FROM user WHERE userEmail='maria.rodriguez@example.com')
       AND goalTitle = 'Sentadillas con 60kg'),
  'Estiramiento post-entreno',
  'Dedicar 10 minutos a estirar piernas',
  NOW(), NOW(),
  'Reduce tensión muscular',
  'Activa', 'Diaria', 10, 'Baja', 'Tarde'
);

INSERT INTO reminder (
  personalProgress_id, reminderTitle, reminderDescription,
  reminderChannel, reminderScheduledTime,
  reminderFrecuency, reminderStatus,
  reminderCreationTime, reminderLastUpdate
) VALUES
  (
    (SELECT idPersonalProgress FROM personalProgress
       WHERE profile_idUser = (SELECT idUser FROM user WHERE userEmail='maria.rodriguez@example.com')),
    'Día de sentadillas', 'Hoy toca sentadillas con 60kg',
    'navegador', '2025-07-01 17:00:00',
    'Semanal', 'Activa', NOW(), NOW()
  ),
  (
    (SELECT idPersonalProgress FROM personalProgress
       WHERE profile_idUser = (SELECT idUser FROM user WHERE userEmail='maria.rodriguez@example.com')),
    'Estiramientos', 'No olvides tu descanso activo',
    'email', '2025-07-01 17:25:00',
    'Semanal', 'Activa', NOW(), NOW()
  );

INSERT INTO feedback (
  personalProgress_id, feedbackTitle, feedbackDescription
) VALUES
  (
    (SELECT idPersonalProgress FROM personalProgress
       WHERE profile_idUser = (SELECT idUser FROM user WHERE userEmail='maria.rodriguez@example.com')),
    '¡Fuerza en aumento!', 'Has incrementado tu carga en sentadillas correctamente.'
  );


-- Alejandro --

INSERT INTO diet (
  goal_idGoal, dietTitle, dietDescription,
  dietStatus, dietCreationDate, dietLastUpdate,
  dietRecommendedTime, dietIngredientsList,
  dietBenefits, dietEstimatedCalories,
  dietProteinPercentage, dietCarbohydratePercentage,
  dietFatPercentage, dietRestriction
) VALUES (
  (SELECT idGoal FROM goal 
     WHERE user_idUser = (SELECT idUser FROM user WHERE userEmail='alejandro.toro@example.com')
       AND goalTitle = 'Meditar 10 min diarios'),
  'Dieta ligera y equilibrada',
  'Frutas, vegetales y cereales integrales',
  'Activa', NOW(), NOW(),
  'Antes de la sesión',
  'Manzana, yogur natural, avena',
  'Fomenta concentración', 1500, 20.00, 50.00, 30.00,
  'Sin estimulantes'
);

INSERT INTO exercise (
  goal_idGoal, exerciseTitle, exerciseDescription,
  exerciseCreationTime, exerciseLastUpdate,
  exerciseStatus, exerciseRecommendedDuration,
  exerciseIntensityLevel, exerciseSets,
  exerciseRepetitions, exerciseRequiredEquipment,
  exerciseMuscularGroup, exerciseBenefits,
  exerciseMultimediaSupport
) VALUES (
  (SELECT idGoal FROM goal 
     WHERE user_idUser = (SELECT idUser FROM user WHERE userEmail='alejandro.toro@example.com')
       AND goalTitle = 'Meditar 10 min diarios'),
  'Yoga suave',
  'Secuencia de posturas para relajación',
  NOW(), NOW(), 'Activa',
  15, 'Baja', 1, 1,
  'Esterilla', 'Flexibilidad',
  'Reduce estrés',
  'video_yoga.mp4'
);

INSERT INTO activePause (
  goal_idGoal, activePauseTitle, activePauseDescription,
  activePauseStepToStep, activePauseStatus,
  activePauseCreationTime, activePauseLastUpdate,
  activePauseBenefits, activePauseRecommendedDuration,
  activePauseRecommendedFrecuency
) VALUES (
  (SELECT idGoal FROM goal 
     WHERE user_idUser = (SELECT idUser FROM user WHERE userEmail='alejandro.toro@example.com')
       AND goalTitle = 'Meditar 10 min diarios'),
  'Respiración consciente',
  'Ejercicio de inhalación y exhalación profunda',
  '1. Inhala 4s… 2. Mantén 4s… 3. Exhala 6s…',
  'Activa', NOW(), NOW(),
  'Calma mente', 5, 'Diaria'
);

INSERT INTO habit (
  goal_idGoal, habitTitle, habitDescription,
  habitCreationTime, habitLastUpdate,
  habitBenefits, habitStatus,
  habitRecommendedFrecuency, habitRecommendedTime,
  habitIntensityLevel, habitSuggestedSchedule
) VALUES (
  (SELECT idGoal FROM goal 
     WHERE user_idUser = (SELECT idUser FROM user WHERE userEmail='alejandro.toro@example.com')
       AND goalTitle = 'Meditar 10 min diarios'),
  'Apagar notificaciones',
  'Silenciar móvil 15 minutos antes de meditar',
  NOW(), NOW(),
  'Mejora concentración',
  'Activa', 'Diaria', 15, 'Baja', 'Mañana'
);

INSERT INTO reminder (
  personalProgress_id, reminderTitle, reminderDescription,
  reminderChannel, reminderScheduledTime,
  reminderFrecuency, reminderStatus,
  reminderCreationTime, reminderLastUpdate
) VALUES
  (
    (SELECT idPersonalProgress FROM personalProgress
       WHERE profile_idUser = (SELECT idUser FROM user WHERE userEmail='alejandro.toro@example.com')),
    'Sesión de meditación', 'Es hora de meditar 10 minutos',
    'push', '2025-07-01 06:50:00',
    'Diaria', 'Activa', NOW(), NOW()
  ),
  (
    (SELECT idPersonalProgress FROM personalProgress
       WHERE profile_idUser = (SELECT idUser FROM user WHERE userEmail='alejandro.toro@example.com')),
    'Yoga suave', 'Realiza tu yoga antes de meditar',
    'movil', '2025-07-01 06:30:00',
    'Diaria', 'Activa', NOW(), NOW()
  );

INSERT INTO feedback (
  personalProgress_id, feedbackTitle, feedbackDescription
) VALUES
  (
    (SELECT idPersonalProgress FROM personalProgress
       WHERE profile_idUser = (SELECT idUser FROM user WHERE userEmail='alejandro.toro@example.com')),
    'Paz interior', 'Has completado todas tus meditaciones esta semana.'
  );
