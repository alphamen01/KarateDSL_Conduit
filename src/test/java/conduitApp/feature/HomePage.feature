Feature: Prueba para la pagina de inicio

Background:Definir URL
    Given url 'https://api.realworld.io/api/'

    Scenario: Obtener todo los tags
        
        Given path 'tags'
        When method Get
        Then status 200

    Scenario: Obtener 10 articulos de la pagina
        #Given param limit = 10
        #Given param offset = 0
        Given params { limit: 10, offset: 0}
        Given path 'articles'
        When method Get
        Then status 200
