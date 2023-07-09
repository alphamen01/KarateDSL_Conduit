Feature: Prueba para la pagina de inicio

Background: Definir URL
    Given url 'https://api.realworld.io/api/'
    @debug
    Scenario: Obtener todo los tags        
        Given path 'tags'
        When method Get
        Then status 200
        And match response.tags contains ['ipsum','qui']
        And match response.tags !contains 'ipsum1'
        And match response.tags == "#array"
        And match each response.tags == '#string'

    Scenario: Obtener 10 articulos de la pagina
        Given params { limit: 10, offset: 0}
        Given path 'articles'
        When method Get
        Then status 200
        And match response.articles == '#array'
        And match response.articles == '#[10]'
        And match each response.articles contains { slug: '#string' }
        And match each response.articles contains { tagList: '#array' }
        And match response.articlesCount == 197
