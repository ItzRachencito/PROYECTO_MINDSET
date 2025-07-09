from flask import Flask
import pymysql.cursors
from config import Config

#from app.config import Config  # Asegúrate que 'config.py' esté dentro de /app
import os

def start_Mindset():
    app = Flask(__name__)
    
    # Cargar configuración desde el archivo .env a través de config.py
    app.config.from_object(Config)

    # Conexión a la base de datos MySQL (sin ORM)
    connection = pymysql.connect(
        host=app.config['MYSQL_HOST'],
        user=app.config['MYSQL_USER'],
        password=app.config['MYSQL_PASSWORD'],
        database=app.config['MYSQL_DB'],
        cursorclass=pymysql.cursors.DictCursor
    )

    # Guardar conexión como atributo de la app
    app.connection = connection

    # Registrar Blueprints
    from app.controllers.startUp_controller import startUp
    from app.controllers.auth_controller import userAuth
    from app.controllers.userData_controller import userData
    from app.controllers.user_controller import userDb
    from app.controllers.admin_controller import adminDb
 


    app.register_blueprint(startUp)
    app.register_blueprint(userAuth)
    app.register_blueprint(userData)
    app.register_blueprint(userDb)
    app.register_blueprint(adminDb)



    return app
