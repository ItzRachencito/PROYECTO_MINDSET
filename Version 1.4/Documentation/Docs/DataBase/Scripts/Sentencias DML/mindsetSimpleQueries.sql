use mindsetQueries;

-- Consultas simples --

	-- Listar todos los roles --
    
    SELECT * 
	FROM role;
    
    -- Listar todos los sexos de usuario --
    
    SELECT * 
	FROM userSex;
    
    -- Obtener todos los usuarios (datos completos) --
    
    SELECT * 
	FROM user;
    
    -- Ver solo nombre, apellido y correo de usuarios --
    
    SELECT userFirstName,
       userFirstLastName,
       userEmail
	FROM user;
    
	-- Mostrar todos los perfiles de usuario --
    
    SELECT * 
	FROM userProfile;
    
    -- Listar todas las metas --
    
    SELECT * 
	FROM goal;
    
    -- Ver todas las dietas --
    
    SELECT * 
	FROM diet;
    
    -- Obtener lista de ejercicios --
    
    SELECT * 
	FROM exercise;
    
    -- Listar pausas activas --
    
    SELECT * 
	FROM activePause;
    
    -- Mostrar hábitos registrados --
    
    SELECT * 
	FROM habit;
    
    -- Ver progreso personal --
    
    SELECT * 
	FROM personalProgress;
    
    -- Listar recordatorios --
    
    SELECT * 
	FROM reminder;
    
    -- Mostrar feedbacks --
    
    SELECT * 
	FROM feedback;