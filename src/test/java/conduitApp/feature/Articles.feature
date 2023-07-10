Feature: Articulos

Background: Definir URL
    Given url apiUrl
    

    Scenario: Crear un nuevo articulo
        Given path 'articles'
        And request {"article": {"title": "Zorro", "description": "Zorroz", "body": "Zorrozo", "tagList": []}}
        When method Post
        Then status 200
        And match response.article.title == 'Zorro'

    Scenario: Crear y Eliminar Articulo
        Given path 'articles'
        And request {"article": {"title": "Perro", "description": "Perros", "body": "Perroso", "tagList": []}}
        When method Post
        Then status 200
        And match response.article.title == 'Perro'
        * def articleId = response.article.slug 

        Given params { limit: 10, offset: 0}
        Given path 'articles'
        When method Get
        Then status 200
        And match response.articles[0].title == 'Perro'

        Given path 'articles', articleId
        When method Delete
        Then status 204

        Given params { limit: 10, offset: 0}
        Given path 'articles'
        When method Get
        Then status 200
        And match response.articles[0].title != 'Perro'
