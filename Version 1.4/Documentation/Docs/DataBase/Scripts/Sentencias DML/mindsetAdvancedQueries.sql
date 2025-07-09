use mindsetQueries;

-- Consultas avanzadas --

	-- Agregaciones / group by --
    
		-- Contar metas por usuario --
        
        SELECT 
		  u.userFirstName,
		  u.userFirstLastName,
		  COUNT(g.idGoal) AS totalMetas
		FROM user AS u
		LEFT JOIN goal AS g
		  ON u.idUser = g.user_idUser
		GROUP BY u.idUser, u.userFirstName, u.userFirstLastName
		ORDER BY totalMetas DESC;
        
        -- Calorías promedio por usuario --
        
        SELECT
		  u.userFirstName,
		  ROUND(AVG(d.dietEstimatedCalories),2) AS kcalPromedio
		FROM user AS u
		JOIN goal AS g
		  ON u.idUser = g.user_idUser
		JOIN diet AS d
		  ON g.idGoal = d.goal_idGoal
		GROUP BY u.idUser
		HAVING kcalPromedio IS NOT NULL
		ORDER BY kcalPromedio DESC;
        
	-- Subconsultas y exist --
    
		-- Usuarios con al menos una dieta > 2000 kcal --
        
        SELECT u.userFirstName, u.userEmail
		FROM user AS u
		WHERE EXISTS (
		  SELECT 1
		  FROM goal AS g
		  JOIN diet AS d
			ON g.idGoal = d.goal_idGoal
		  WHERE g.user_idUser = u.idUser
			AND d.dietEstimatedCalories > 2000
		);
        
        -- Metas sin hábitos asociados --
        
        SELECT g.idGoal, g.goalTitle
		FROM goal AS g
		WHERE NOT EXISTS (
		  SELECT 1
		  FROM habit AS h
		  WHERE h.goal_idGoal = g.idGoal
		);
        
	-- CTE expresiones de tablas comunes --
    
		-- Ranking de usuarios por metas activas --
        
        WITH metas_activas AS (
		  SELECT user_idUser, COUNT(*) AS cnt
		  FROM goal
		  WHERE goalStatus = 'Activa'
		  GROUP BY user_idUser
		)
		SELECT
		  ROW_NUMBER() OVER (ORDER BY m.cnt DESC) AS ranking,
		  u.userFirstName,
		  m.cnt AS totalActivas
		FROM metas_activas AS m
		JOIN user AS u
		  ON u.idUser = m.user_idUser;
          
		-- Último recordatorio por usuario --
        
        WITH all_reminders AS (
		  SELECT
			pp.profile_idUser,
			r.reminderTitle,
			r.reminderScheduledTime,
			ROW_NUMBER() OVER (
			  PARTITION BY pp.profile_idUser
			  ORDER BY r.reminderScheduledTime DESC
			) AS rn
		  FROM personalProgress AS pp
		  JOIN reminder AS r
			ON pp.idPersonalProgress = r.personalProgress_id
		)
		SELECT
		  u.userFirstName,
		  ar.reminderTitle,
		  ar.reminderScheduledTime
		FROM all_reminders AS ar
		JOIN user AS u
		  ON u.idUser = ar.profile_idUser
		WHERE ar.rn = 1;
        
	-- Subconsultas en select y filtros --
    
		-- Porcentaje de metas completadas --
        
        SELECT
		  u.userFirstName,
		  ROUND(
			100.0 * (
			  SELECT COUNT(*) 
			  FROM goal 
			  WHERE user_idUser = u.idUser 
				AND goalStatus = 'Inactiva'
			) / GREATEST(COUNT(g.idGoal),1), 2
		  ) AS pctCompletadas
		FROM user AS u
		LEFT JOIN goal AS g
		  ON u.idUser = g.user_idUser
		GROUP BY u.idUser;
        
        -- Usuarios inactivos en el último mes --
        
        SELECT 
		  u.userFirstName,
		  u.userEmail,
		  pp.progressLastUpdate
		FROM user AS u
		JOIN personalProgress AS pp
		  ON u.idUser = pp.profile_idUser
		WHERE pp.progressLastUpdate < NOW() - INTERVAL 30 DAY;
        
	-- Combinando CTE y agregaciones --
    
		-- Promedio de duración de ejercicios por usuario --
        
        WITH suma_tiempo AS (
		  SELECT g.user_idUser, SUM(e.exerciseRecommendedDuration) AS totalMin
		  FROM exercise AS e
		  JOIN goal AS g
			ON e.goal_idGoal = g.idGoal
		  GROUP BY g.user_idUser
		),
		conteo_ejercicios AS (
		  SELECT g.user_idUser, COUNT(*) AS cnt
		  FROM exercise AS e
		  JOIN goal AS g
			ON e.goal_idGoal = g.idGoal
		  GROUP BY g.user_idUser
		)
		SELECT
		  u.userFirstName,
		  ROUND(s.totalMin / GREATEST(c.cnt,1),2) AS durPromedioMin
		FROM suma_tiempo AS s
		JOIN conteo_ejercicios AS c
		  ON s.user_idUser = c.user_idUser
		JOIN user AS u
		  ON u.idUser = s.user_idUser;
        
        
        