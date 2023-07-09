Feature: Articulos

Background: Definir URL
    Given url 'https://api.realworld.io/api/'
    Given path 'users/login'
        And request {"user": {"email": "lesg.2233@gmail.com", "password": "LuisEnrique"}}
        When method Post 
        Then status 200
        * def token = response.user.token

    Scenario: Crear un nuevo articulo
        Given header Authorization = 'Token ' + token
        Given path 'articles'
        And request {"article": {"title": "Zorro", "description": "Zorroz", "body": "Zorrozo", "tagList": []}}
        When method Post
        Then status 200
        And match response.article.title == 'Zorro'