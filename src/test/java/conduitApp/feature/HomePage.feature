@debug
Feature: Prueba para la pagina de inicio

Background: Definir URL
    Given url apiUrl
    
    Scenario: Obtener todo los tags        
        Given path 'tags'
        When method Get
        Then status 200
        And match response.tags contains ['ipsum','qui']
        And match response.tags !contains 'ipsum1'
        And match response.tags == "#array"
        And match each response.tags == '#string'
        And match response.tags  contains any ['implementations','cars','dogs']

    Scenario: Obtener 10 articulos de la pagina
        * def timeValidator = read('classpath:helpers/timeValidator.js')

        Given params { limit: 10, offset: 0}
        Given path 'articles'
        When method Get
        Then status 200
        And match response.articles == '#array'
        And match response.articles == '#[10]'
        #And match each response.articles contains { slug: '#string' }
        #And match each response.articles contains { tagList: '#array' }
        #And match response.articlesCount == 201
        #And match response == { "articles": "#array", "articlesCount": "#number"}
        #And match response.articles[0].createdAt contains '2023'
        #And match response.articles[*].favoritesCount contains 0
        #And match response.articles[*].author.bio contains null
        #And match each response..following == false
        #And match each response..following == '#boolean'
        #And match each response..favoritesCount == '#number'
        #And match each response..bio == '##string'
        And match each response.articles ==
        """
        {
            "slug": '#string',
            "title": '#string',
            "description": '#string',
            "body": '#string',
            "tagList": '#array',
            "createdAt": '#? timeValidator(_)',
            "updatedAt": '#? timeValidator(_)',
            "favorited": '#boolean',
            "favoritesCount": '#number',
            "author": {
                "username": '#string',
                "bio": '##string',
                "image": '#string',
                "following": '#boolean'
            }
        }
        """
