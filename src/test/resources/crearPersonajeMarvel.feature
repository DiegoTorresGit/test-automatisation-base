@REQ_HU-ditorres @HUditorres @create_marvel_character @marvel_characters_api @Agente2 @E2 @iniciativa_marvel_api
Feature: HU-ditorres Crear personaje Marvel (microservicio para gestión de personajes)
  Background:
    * url port_marvel_characters_api
    * def generarHeaders =
      """
      function() {
        return {
          "Content-Type": "application/json"
        };
      }
      """
    * def headers = generarHeaders()
    * headers headers

  @id:1 @crearPersonaje @solicitudExitosa201
  Scenario: T-API-HU-ditorres-CA01-Crear personaje exitosamente 201 - karate
    * def jsonData = read('classpath:data/marvel_characters_api/request_create_character.json')
    And request jsonData
    When method POST
    Then status 201
    # And match response != null
    # And match response.id != null

  @id:2 @crearPersonaje @errorNombreDuplicado400
  Scenario: T-API-HU-ditorres-CA02-Crear personaje con nombre duplicado 400 - karate
    * def jsonData = read('classpath:data/marvel_characters_api/request_create_character_duplicate.json')
    And request jsonData
    When method POST
    Then status 400
    # And match response.error contains 'already exists'
    # And match response != null

  @id:3 @crearPersonaje @errorCamposRequeridos400
  Scenario: T-API-HU-ditorres-CA03-Crear personaje con campos requeridos vacíos 400 - karate
    * def jsonData = read('classpath:data/marvel_characters_api/request_create_character_invalid.json')
    And request jsonData
    When method POST
    Then status 400
    # And match response.name contains 'required'
    # And match response.powers contains 'required'
