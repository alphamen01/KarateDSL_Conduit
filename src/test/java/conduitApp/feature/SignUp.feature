
Feature: Registrando un nuevo Usuario

Background:
    * def dataGenerator = Java.type('helpers.DataGenerator')
    * url apiUrl
    
    @debug
    Scenario: Registro de nuevo usuario
        #Given def userData = {"email": "lesg.2233.13@gmail.com",  "username": "alphaman13"}
        * def randomEmail = dataGenerator.getRandomEmail()
        * def randomUserName = dataGenerator.getRandomUserName()

        * def jsFunction =
        """
            function () {
                var DataGenerator = Java.type('helpers.DataGenerator')
                var generator = new DataGenerator()
                return generator.getRandomUserName2()
            }
        """
        * def randomUserNametwo = call jsFunction 

        Given path 'users'
        And request 
        """
        {
            "user": {
                "email": #(randomEmail),
                "password": "LuisEnrique",
                "username": #(randomUserNametwo)
                    }
        }
        """
        When method Post
        Then status 200
        And match response ==
        """
        {
            "user": {
                "email": #(randomEmail),
                "username": #(randomUserNametwo),
                "bio": '##string',
                "image": '#string',
                "token": '##string'
            }
        }
        """