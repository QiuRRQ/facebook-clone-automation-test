Feature: Login ke aplikasi dengan berbagai jenis input, serta diarahkan ke page profile setelah berhasil login dengan validasi
  Scenario Outline: validasi input email dan password ketika login, password harus required, dan email harus valid
    Given I have "inputEmail" and "inputPassword" and "loginButton"
    When I fill the "inputEmail" field with "<email>"
    And I fill the "inputPassword" field with "<password>"
    Then I tap the "loginButton" button
    Then I have "<current-page>" on screen
    Examples:
      | email                  | password        | current-page |
      | azizur.rohim@gmail.com | filledPassword@ | profilePage  |
      | invalidmail.com        | filledPassword@ | loginPage    |
      | azizur.rohim@gmail.com |                 | loginPage    |
      | invalidmail.com        |                 | loginPage    |
      |                        |                 | loginPage    |