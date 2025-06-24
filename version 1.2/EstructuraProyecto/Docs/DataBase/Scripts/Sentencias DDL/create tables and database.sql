create database MINDSET;

use MINDSET;

create table user (
    idUser int primary key auto_increment not null unique,
    userRole enum('Usuario', 'Administrador') not null,
    userFirstName varchar(20) not null,
    userSecondName varchar(20),
    userFirstLastName varchar(20) not null,
    userSecondLastName varchar(20),
    userBirthDate date not null,
    userGender enum('Masculino', 'Femenino', 'Otro') not null,
    userEmail varchar(100) unique not null,
    userPassword varchar(20) not null,
    userSignUpDate date not null,
    userSignOutDate datetime not null,
    userAccountStatus enum('Activa', 'Inactiva')
    
);

create table goal (
    idGoal int primary key auto_increment not null unique,
    goalTitle varchar(100) not null,
    goalDescription text not null,
    goalPriority enum('Alta','Media','Baja') not null,
    goalStatus enum('Activa', 'Inactiva','Aplazada','Cancelada')not null,
    goalCreationTime datetime not null,
    goalLastUpdate datetime not null,
    goalStartDate date,
    goalEndDate date,
    goalMotivationNote text

);

create table exercise (
    idExercise int primary key auto_increment not null unique,
    exerciseTitle varchar(100),
    exerciseDescription text,
    exerciseCreationTime datetime not null,
    exerciseStatus enum('Activa', 'Inactiva','Aplazada','Cancelada')not null,
	exerciseLastUpdate datetime not null,
    exerciseRecommendedDuration int,
	exerciseIntensityLevel enum('Alta','Media','Baja'),
    exerciseSets int,
    exerciseRepetitions int,
    exerciseRequiredEquipment text,
    exerciseMuscularGroup varchar(100),
    exerciseBenefits text,
    exerciseMultimediaSupport TEXT
    
);

create table activePause (
    idActivePause int primary key auto_increment not null unique,
    activePauseTitle VARCHAR(100) not null,
    activePauseDescription TEXT not null,
    activePauseStepToStep text not null,
    activePauseStatus enum('Activa', 'Inactiva','Aplazada','Cancelada')not null,
    activePauseLastUpdate datetime not null,
    activePauseCreationTime datetime not null,
    activePauseBenefits text,
    activePauseRecommendedDuration int,
    activePauseRecommendedFrecuency varchar(20)
    
);

create table diet (
    idDiet int primary key auto_increment not null unique,
    dietTitle VARCHAR(45) not null,
    dietDescription TEXT not null,
    dietGoal varchar(45) not null,
    dietStatus enum('Activa', 'Inactiva','Aplazada','Cancelada')not null,
    dietCreationDate datetime not null,
    dietLastUpdate datetime not null,
    dietRecommendedTime varchar(20) not null,
    dietIngredientsList text not null,
    dietBenefits text not null,
    dietEstimatedCalories decimal(10,2),
    dietProteinPercentage decimal(10,2),
    dietCarbohydratePercentage decimal (10,2),
    dietFatPercentage decimal (10,2),
    dietRestriction text
);

create table habit(
	idHabit int primary key auto_increment not null unique,
    habitTitle varchar(100) not null,
    habitDescription text not null,
    habitCreationTime datetime not null,
    habitLastUpdate datetime not null,
    habitBenefits text not null,
    habitStatus enum('Activa', 'Inactiva','Aplazada','Cancelada')not null,
    habitRecommendedFrecuency varchar(50),
    habitRecommendedTime int,
    habitIntensityLevel enum('Alta','Media','Baja'),
    habitSuggestedSchedule enum('Mañana','Tarde','Dia')
);

create table personalProgress(
	idPersonalProgress int primary key auto_increment not null unique,
    progressPeriodTime enum('semanalmente','mensualmente','trimestralmente','semestralmente','anualmente') not null,
    progressStartTime datetime not null,
    progressEndTime datetime not null,
    progressSummaryAchievements text not null,
    progressData json not null,
    progressGraphic json not null,
    progressGeneralRate decimal(10,2) not null,
    progressCreationDate datetime not null,
    progressLastUpdate datetime not null,
    progressCongratulationMessage text
    
);

create table reminder(
	idReminder int primary key auto_increment not null unique,
    reminderTitle varchar(100) not null,
    reminderDescription text not null,
    reminderchannel enum('movil', 'navegador', 'email', 'push') not null,
    reminderScheduledTime datetime not null,
    reminderFrecuency varchar(45) not null,
    reminderStatus enum('Activa', 'Inactiva','Aplazada','Cancelada')not null,
    reminderCreationTime datetime not null,
    reminderLastUpdate datetime not null
);

create table feedback(
	idFeedback int primary key auto_increment not null unique,
    feedbackTitle varchar(100) not null,
    feedbackDescription text not null
);

create table userProfile(
	profileLastUpdate datetime,
	profileJobStartTime time,
    profileJobEndTime time,
    profileDailyFreeMinutes int,
    profileCurrentDiet enum('Regular','Ganar peso','Perder peso'),
    profileDailyFoodsAverage int,
    profileEstimatedDailyWaterLitres decimal(10,2),
    profileSleepTimeAverage decimal(10,2),
    profileCurrentPhysicStatus enum('Avanzado','Intermedio','Principiante'),
    profileExerciseSessionsFrecuencyWeekly int,
    profileFavoriteExerciseType enum('relajación','fuerza','cardio','otro'),
    profileScreenTimeAverage int,
    profileStressScale tinyint(10),
    profileCurrentHabit tinytext
    
);

create table initialDataForm(
	idForm int primary key auto_increment not null unique,
    formFilledDate datetime not null,
	formJobStartTime time,
    formeJobEndTime time,
    formDailyFreeMinutes int,
    formCurrentDiet enum('Regular','Ganar peso','Perder peso'),
    formDailyFoodsAverage int,
    formEstimatedDailyWaterLitres decimal(10,2),
    formSleepTimeAverage decimal(10,2),
    formCurrentPhysicStatus enum('Avanzado','Intermedio','Principiante'),
    formExerciseSessionsFrecuencyWeekly int,
    formFavoriteExerciseType enum('relajación','fuerza','cardio','otro'),
    formScreenTimeAverage int,
    formStressScale tinyint(10),
    formCurrentHabit tinytext	
);



-- 1. Relación: Cada goal pertenece a un user
ALTER TABLE goal 
  ADD COLUMN user_idUser INT NOT NULL,
  ADD CONSTRAINT fk_goal_user 
    FOREIGN KEY (user_idUser) 
    REFERENCES user(idUser)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
    
-- 2. Relación: Cada personalProgress pertenece a un user
ALTER TABLE personalProgress 
  ADD COLUMN user_idUser INT NOT NULL,
  ADD CONSTRAINT fk_progress_user 
    FOREIGN KEY (user_idUser) 
    REFERENCES user(idUser)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- 3. Relación: Cada userProfile pertenece a un user
ALTER TABLE userProfile 
  ADD COLUMN user_idUser INT NOT NULL,
  ADD CONSTRAINT fk_userProfile_user 
    FOREIGN KEY (user_idUser) 
    REFERENCES user(idUser)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
  
-- 4. Relación: Cada initialDataForm pertenece a un user
ALTER TABLE initialDataForm 
  ADD COLUMN user_idUser INT NOT NULL,
  ADD CONSTRAINT fk_initialDataForm_user 
    FOREIGN KEY (user_idUser) 
    REFERENCES user(idUser)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- 5. Relación: Cada feedback pertenece a un user y opcionalmente a un personalProgress
ALTER TABLE feedback 
  ADD COLUMN user_idUser INT NOT NULL,
  ADD COLUMN personalProgress_idPersonalProgress INT,
  ADD CONSTRAINT fk_feedback_user 
    FOREIGN KEY (user_idUser) 
    REFERENCES user(idUser)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  ADD CONSTRAINT fk_feedback_progress 
    FOREIGN KEY (personalProgress_idPersonalProgress) 
    REFERENCES personalProgress(idPersonalProgress)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
    
    
-- Relación N:N entre goal y exercise
CREATE TABLE goal_has_exercise (
    idGoal INT NOT NULL,
    idExercise INT NOT NULL,
    PRIMARY KEY (idGoal, idExercise),
    FOREIGN KEY (idGoal) REFERENCES goal(idGoal) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idExercise) REFERENCES exercise(idExercise) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Relación N:N entre goal y diet
CREATE TABLE goal_has_diet (
    idGoal INT NOT NULL,
    idDiet INT NOT NULL,
    PRIMARY KEY (idGoal, idDiet),
    FOREIGN KEY (idGoal) REFERENCES goal(idGoal) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idDiet) REFERENCES diet(idDiet) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Relación N:N entre goal y activePause
CREATE TABLE goal_has_activePause (
    idGoal INT NOT NULL,
    idActivePause INT NOT NULL,
    PRIMARY KEY (idGoal, idActivePause),
    FOREIGN KEY (idGoal) REFERENCES goal(idGoal) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idActivePause) REFERENCES activePause(idActivePause) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Relación N:N entre goal y habit
CREATE TABLE goal_has_habit (
    idGoal INT NOT NULL,
    idHabit INT NOT NULL,
    PRIMARY KEY (idGoal, idHabit),
    FOREIGN KEY (idGoal) REFERENCES goal(idGoal) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idHabit) REFERENCES habit(idHabit) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Relación N:N entre habit y exercise
CREATE TABLE habit_has_exercise (
    idHabit INT NOT NULL,
    idExercise INT NOT NULL,
    PRIMARY KEY (idHabit, idExercise),
    FOREIGN KEY (idHabit) REFERENCES habit(idHabit) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idExercise) REFERENCES exercise(idExercise) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Relación N:N entre habit y diet
CREATE TABLE habit_has_diet (
    idHabit INT NOT NULL,
    idDiet INT NOT NULL,
    PRIMARY KEY (idHabit, idDiet),
    FOREIGN KEY (idHabit) REFERENCES habit(idHabit) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idDiet) REFERENCES diet(idDiet) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Relación N:N entre habit y activePause
CREATE TABLE habit_has_activePause (
    idHabit INT NOT NULL,
    idActivePause INT NOT NULL,
    PRIMARY KEY (idHabit, idActivePause),
    FOREIGN KEY (idHabit) REFERENCES habit(idHabit) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idActivePause) REFERENCES activePause(idActivePause) 
        ON DELETE CASCADE ON UPDATE CASCADE
);



CREATE TABLE user_has_exercise (
    user_idUser INT NOT NULL,
    idExercise INT NOT NULL,
    PRIMARY KEY (user_idUser, idExercise),
    FOREIGN KEY (user_idUser) REFERENCES user(idUser)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idExercise) REFERENCES exercise(idExercise)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE user_has_diet (
    user_idUser INT NOT NULL,
    idDiet INT NOT NULL,
    PRIMARY KEY (user_idUser, idDiet),
    FOREIGN KEY (user_idUser) REFERENCES user(idUser)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idDiet) REFERENCES diet(idDiet)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE user_has_habit (
    user_idUser INT NOT NULL,
    idHabit INT NOT NULL,
    PRIMARY KEY (user_idUser, idHabit),
    FOREIGN KEY (user_idUser) REFERENCES user(idUser)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idHabit) REFERENCES habit(idHabit)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE user_has_activePause (
    user_idUser INT NOT NULL,
    idActivePause INT NOT NULL,
    PRIMARY KEY (user_idUser, idActivePause),
    FOREIGN KEY (user_idUser) REFERENCES user(idUser)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idActivePause) REFERENCES activePause(idActivePause)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Relación N:N entre user y reminder, en caso de que un recordatorio
-- puede asignarse a varios usuarios o viceversa.
CREATE TABLE user_has_reminder (
    idUser INT NOT NULL,
    idReminder INT NOT NULL,
    PRIMARY KEY (idUser, idReminder),
    FOREIGN KEY (idUser) REFERENCES user(idUser)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idReminder) REFERENCES reminder(idReminder)
        ON DELETE CASCADE ON UPDATE CASCADE
);






