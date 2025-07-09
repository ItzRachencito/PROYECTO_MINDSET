
drop database if exists mindsetQueries;

CREATE DATABASE mindsetQueries;

USE mindsetQueries;


-- --------------------------------------------------
-- Tabla de roles
-- --------------------------------------------------
CREATE TABLE role (
  idRole INT AUTO_INCREMENT PRIMARY KEY,
  roleName VARCHAR(50) NOT NULL UNIQUE,
  roleDescription TEXT
);

-- --------------------------------------------------
-- Tabla de sexos de usuario
-- --------------------------------------------------
CREATE TABLE userSex (
  idUserSex INT AUTO_INCREMENT PRIMARY KEY,
  userSexName VARCHAR(20) NOT NULL UNIQUE,
  userSexDescription TEXT
);

-- --------------------------------------------------
-- Tabla de usuarios
-- --------------------------------------------------
CREATE TABLE user (
  idUser INT AUTO_INCREMENT PRIMARY KEY,
  role_idRole INT NOT NULL,
  userFirstName VARCHAR(20) NOT NULL,
  userSecondName VARCHAR(20),
  userFirstLastName VARCHAR(20) NOT NULL,
  userSecondLastName VARCHAR(20),
  userBirthDate DATE,
  userEmail VARCHAR(100) NOT NULL UNIQUE,
  userPassword VARCHAR(255) NOT NULL,
  userAccountStatus ENUM('Activa','Inactiva') NOT NULL DEFAULT 'Activa',
  FOREIGN KEY (role_idRole) REFERENCES role(idRole)
);

-- --------------------------------------------------
-- Tabla de perfiles de usuario
-- --------------------------------------------------
CREATE TABLE userProfile (
  idUser int primary key,
  idUserSex INT NOT NULL,
  profileJobStartTime TIME,
  profileJobEndTime TIME,
  profileDailyFreeMinutes INT DEFAULT 0,
  profileCurrentDiet ENUM('Regular','Ganar peso','Perder peso'),
  profileDailyFoodsAverage INT DEFAULT 3,
  profileEstimatedDailyWaterLitres DECIMAL(10,2) DEFAULT 2.00,
  profileSleepTimeAverage DECIMAL(10,2) DEFAULT 7.00,
  profileCurrentPhysicStatus ENUM('Avanzado','Intermedio','Principiante'),
  profileExerciseSessionsFrecuencyWeekly INT DEFAULT 0,
  profileFavoriteExerciseType ENUM('Relajación','Fuerza','Cardio','Otro'),
  profileScreenTimeAverage INT DEFAULT 0,
  profileStressScale TINYINT DEFAULT 0,
  CONSTRAINT fk_up_user FOREIGN KEY (idUser)
    REFERENCES user(idUser)
    ON DELETE CASCADE,
  CONSTRAINT fk_up_sex FOREIGN KEY (idUserSex)
    REFERENCES userSex(idUserSex)
);

-- Metas de usuario
CREATE TABLE goal (
  idGoal INT AUTO_INCREMENT PRIMARY KEY,
  user_idUser INT NOT NULL,
  goalTitle VARCHAR(100) NOT NULL,
  goalDescription TEXT,
  goalPriority ENUM('Alta','Media','Baja') NOT NULL,
  goalStatus ENUM('Activa','Inactiva','Aplazada','Cancelada') NOT NULL DEFAULT 'Activa',
  goalCreationTime DATETIME NOT NULL,
  goalLastUpdate DATETIME NOT NULL,
  goalStartDate DATE,
  goalEndDate DATE,
  goalMotivationNote TEXT,
  FOREIGN KEY (user_idUser) REFERENCES user(idUser)
    ON DELETE CASCADE
);

-- Dietas asociadas a una meta
CREATE TABLE diet (
  idDiet INT AUTO_INCREMENT PRIMARY KEY,
  goal_idGoal INT NOT NULL,
  dietTitle VARCHAR(45) NOT NULL,
  dietDescription TEXT NOT NULL,
  dietStatus ENUM('Activa','Inactiva','Aplazada','Cancelada') NOT NULL DEFAULT 'Activa',
  dietCreationDate DATETIME NOT NULL,
  dietLastUpdate DATETIME NOT NULL,
  dietRecommendedTime VARCHAR(20) NOT NULL,
  dietIngredientsList TEXT NOT NULL,
  dietBenefits TEXT NOT NULL,
  dietEstimatedCalories DECIMAL(10,2),
  dietProteinPercentage DECIMAL(5,2),
  dietCarbohydratePercentage DECIMAL(5,2),
  dietFatPercentage DECIMAL(5,2),
  dietRestriction TEXT,
  FOREIGN KEY (goal_idGoal) REFERENCES goal(idGoal)
    ON DELETE CASCADE
);

-- Ejercicios asociados a una meta
CREATE TABLE exercise (
  idExercise INT AUTO_INCREMENT PRIMARY KEY,
  goal_idGoal INT NOT NULL,
  exerciseTitle VARCHAR(100),
  exerciseDescription TEXT,
  exerciseCreationTime DATETIME NOT NULL,
  exerciseLastUpdate DATETIME NOT NULL,
  exerciseStatus ENUM('Activa','Inactiva','Aplazada','Cancelada') NOT NULL DEFAULT 'Activa',
  exerciseRecommendedDuration INT,
  exerciseIntensityLevel ENUM('Alta','Media','Baja'),
  exerciseSets INT,
  exerciseRepetitions INT,
  exerciseRequiredEquipment TEXT,
  exerciseMuscularGroup VARCHAR(100),
  exerciseBenefits TEXT,
  exerciseMultimediaSupport TEXT,
  FOREIGN KEY (goal_idGoal) REFERENCES goal(idGoal)
    ON DELETE CASCADE
);

-- Pausas activas asociadas a una meta
CREATE TABLE activePause (
  idActivePause INT AUTO_INCREMENT PRIMARY KEY,
  goal_idGoal INT NOT NULL,
  activePauseTitle VARCHAR(100) NOT NULL,
  activePauseDescription TEXT NOT NULL,
  activePauseStepToStep TEXT NOT NULL,
  activePauseStatus ENUM('Activa','Inactiva','Aplazada','Cancelada') NOT NULL DEFAULT 'Activa',
  activePauseCreationTime DATETIME NOT NULL,
  activePauseLastUpdate DATETIME NOT NULL,
  activePauseBenefits TEXT,
  activePauseRecommendedDuration INT,
  activePauseRecommendedFrecuency VARCHAR(20),
  FOREIGN KEY (goal_idGoal) REFERENCES goal(idGoal)
    ON DELETE CASCADE
);

-- Hábitos asociados a una meta
CREATE TABLE habit (
  idHabit INT AUTO_INCREMENT PRIMARY KEY,
  goal_idGoal INT NOT NULL,
  habitTitle VARCHAR(100) NOT NULL,
  habitDescription TEXT NOT NULL,
  habitCreationTime DATETIME NOT NULL,
  habitLastUpdate DATETIME NOT NULL,
  habitBenefits TEXT NOT NULL,
  habitStatus ENUM('Activa','Inactiva','Aplazada','Cancelada') NOT NULL DEFAULT 'Activa',
  habitRecommendedFrecuency VARCHAR(50),
  habitRecommendedTime INT,
  habitIntensityLevel ENUM('Alta','Media','Baja'),
  habitSuggestedSchedule ENUM('Mañana','Tarde','Día'),
  FOREIGN KEY (goal_idGoal) REFERENCES goal(idGoal)
    ON DELETE CASCADE
);

CREATE TABLE personalProgress (
  idPersonalProgress INT AUTO_INCREMENT PRIMARY KEY,
  profile_idUser INT NOT NULL UNIQUE,
  progressPeriodTime ENUM(
    'semanalmente','mensualmente','trimestralmente',
    'semestralmente','anualmente'
  ) NOT NULL,
  progressStartTime DATETIME NOT NULL,
  progressEndTime DATETIME NOT NULL,
  progressSummaryAchievements TEXT NOT NULL,
  progressData TEXT NOT NULL,
  progressGraphic TEXT NOT NULL,
  progressGeneralRate DECIMAL(5,2) NOT NULL,
  progressCreationDate DATETIME NOT NULL,
  progressLastUpdate DATETIME NOT NULL,
  progressCongratulationMessage TEXT,
  FOREIGN KEY (profile_idUser) REFERENCES userProfile(idUser)
    ON DELETE CASCADE
);

-- Recordatorios vinculados al progreso personal
CREATE TABLE reminder (
  idReminder INT AUTO_INCREMENT PRIMARY KEY,
  personalProgress_id INT NOT NULL,
  reminderTitle VARCHAR(100) NOT NULL,
  reminderDescription TEXT NOT NULL,
  reminderChannel ENUM('movil','navegador','email','push') NOT NULL,
  reminderScheduledTime DATETIME NOT NULL,
  reminderFrecuency VARCHAR(45) NOT NULL,
  reminderStatus ENUM('Activa','Inactiva','Aplazada','Cancelada') NOT NULL,
  reminderCreationTime DATETIME NOT NULL,
  reminderLastUpdate DATETIME NOT NULL,
  FOREIGN KEY (personalProgress_id) REFERENCES personalProgress(idPersonalProgress)
    ON DELETE CASCADE
);

-- Feedback vinculado al progreso personal
CREATE TABLE feedback (
  idFeedback INT AUTO_INCREMENT PRIMARY KEY,
  personalProgress_id INT NOT NULL,
  feedbackTitle VARCHAR(100) NOT NULL,
  feedbackDescription TEXT NOT NULL,
  FOREIGN KEY (personalProgress_id) REFERENCES personalProgress(idPersonalProgress)
    ON DELETE CASCADE
);

-- --------------------------------------------------
-- Datos iniciales para roles y sexos
-- --------------------------------------------------
INSERT INTO role (roleName, roleDescription) VALUES
  ('Administrador','Usuario con permisos totales'),
  ('Usuario','Usuario estándar con permisos limitados');

INSERT INTO userSex (userSexName, userSexDescription) VALUES
  ('Masculino','Hombre'),
  ('Femenino','Mujer'),
  ('Otro','Otro');

-- --------------------------------------------------
-- Usuario de administrador (password en texto plano)
-- --------------------------------------------------
INSERT INTO user (
  role_idRole,
  userFirstName,
  userSecondName,
  userFirstLastName,
  userSecondLastName,
  userBirthDate,
  userEmail,
  userPassword
) VALUES (
  1,
  'Cristiano',
  'Ronaldo',
  'Dos Santos',
  'Aveiro',
  '1985-02-25',
  'cristianoRonaldo@mindset.com',
  '123456'
);

