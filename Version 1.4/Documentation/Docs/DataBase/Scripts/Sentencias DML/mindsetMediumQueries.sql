use mindsetQueries;

-- Consultas con filtros sencillos --

	-- Usuarios nacidos después de 1990-01-01 --

	SELECT userFirstName,
		   userBirthDate
	FROM user
	WHERE userBirthDate > '1990-01-01';
    
    -- Metas con prioridad alta --
    
    SELECT goalTitle,goalPriority
	FROM goal
	WHERE goalPriority = 'Alta';
    
    -- Dietas activas --
    
    SELECT dietTitle,
       dietStatus
	FROM diet
	WHERE dietStatus = 'Activa';
    
    -- Ejercicios con intensidad “Alta” --
    
	SELECT exerciseTitle,
       exerciseIntensityLevel
	FROM exercise
	WHERE exerciseIntensityLevel = 'Alta';
    
    -- Hábitos sugeridos para “Mañana” --

	SELECT habitTitle,
       habitSuggestedSchedule
	FROM habit
	WHERE habitSuggestedSchedule = 'Mañana';
    
-- Consultas con join simples --

	-- Usuarios con su rol --
    
    SELECT u.idUser,
       u.userFirstName,
       r.roleName
	FROM user AS u
	JOIN role AS r
	  ON u.role_idRole = r.idRole;
      
	-- Usuarios con su sexo y perfil --
    
    SELECT u.userFirstName,
       up.profileJobStartTime,
       us.userSexName
	FROM user AS u
	JOIN userProfile AS up
	  ON u.idUser = up.idUser
	JOIN userSex AS us
	  ON up.idUserSex = us.idUserSex;
      
	-- Metas de cada usuario --
    
    SELECT u.userFirstName,
       g.goalTitle,
       g.goalStatus
	FROM user AS u
	JOIN goal AS g
	  ON u.idUser = g.user_idUser;
      
	-- Dietas asociadas a cada meta --
    
    SELECT g.goalTitle,
       d.dietTitle,
       d.dietEstimatedCalories
	FROM goal AS g
	JOIN diet AS d
	  ON g.idGoal = d.goal_idGoal;
      
	-- Progreso y recordatorios --
    
    SELECT pp.idPersonalProgress,
       r.reminderTitle,
       r.reminderScheduledTime
	FROM personalProgress AS pp
	JOIN reminder AS r
	  ON pp.idPersonalProgress = r.personalProgress_id;
      
-- Consultas usando order by y limit --

	-- Últimos 5 usuarios registrados (por id) --
    
    SELECT idUser,
       userFirstName
	FROM user
	ORDER BY idUser DESC
	LIMIT 5;
    
    -- Metas ordenadas por fecha de creación más reciente --
    
    SELECT goalTitle,
       goalCreationTime
	FROM goal
	ORDER BY goalCreationTime DESC;
    
    -- Dietas con más calorías (top 3) --
    
    SELECT dietTitle,
       dietEstimatedCalories
	FROM diet
	ORDER BY dietEstimatedCalories DESC
	LIMIT 3;

    

