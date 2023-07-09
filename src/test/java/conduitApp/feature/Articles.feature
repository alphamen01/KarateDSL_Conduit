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

    Scenario: Crear y Eliminar Articulo
        Given header Authorization = 'Token ' + token
        Given path 'articles'
        And request {"article": {"title": "Perro", "description": "Perros", "body": "Perroso", "tagList": []}}
        When method Post
        Then status 200
        And match response.article.title == 'Perro'
        * def articleId = response.article.slug 

        Given header Authorization = 'Token ' + token
        Given params { limit: 10, offset: 0}
        Given path 'articles'
        When method Get
        Then status 200
        And match response.articles[0].title == 'Perro'

        Given header Authorization = 'Token ' + token
        Given path 'articles', articleId
        When method Delete
        Then status 204

        Given header Authorization = 'Token ' + token
        Given params { limit: 10, offset: 0}
        Given path 'articles'
        When method Get
        Then status 200
        And match response.articles[0].title != 'Perro'
