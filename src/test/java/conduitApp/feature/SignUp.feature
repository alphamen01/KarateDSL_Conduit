Feature: Registrando un nuevo Usuario

Background:
    Given url apiUrl
    @debug
    Scenario: Registro de nuevo usuario
        Given def userData = {"email": "lesg.2233.13@gmail.com",  "username": "alphaman13"}

        Given path 'users'
        And request 
        """
        {
            "user": {
                "email": #(userData.email),
                "password": "LuisEnrique",
                "username": #(userData.username)
                    }
        }
        """
        When method Post
        Then status 200