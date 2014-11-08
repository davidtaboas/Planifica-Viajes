Feature: Home page
  Página de inicio debería mostrar libros

  Scenario: Load Home
    Cargamos la página
    Y hay libros
    Given I am on the home page
    Then I should see "Libros leídos"