def create_new_user(connection,userFirstName,userSecondName,userFirstLastName,userSecondLastName,userBirthDate,userEmail,hashed_password):
    default_role = 2
    with connection.cursor() as cursor:
        cursor.execute(
            "insert into user(role_idRole, userFirstName,userSecondName,userFirstLastName,userSecondLastName,userBirthDate,userEmail,userPassword) values (%s,%s,%s,%s,%s,%s,%s,%s)",
            (default_role,userFirstName,userSecondName,userFirstLastName,userSecondLastName,userBirthDate,userEmail,hashed_password)
        )
        connection.commit()

def get_user_by_email(connection, userEmail):
    with connection.cursor() as cursor:
        cursor.execute("select idUser, userPassword,role_idRole from user where userEmail=%s", (userEmail,))
        return cursor.fetchone() 