*** Settings ***
Resource     ../pages/LoginPage.robot
Variables    ../variables/login.py

Test Setup       Open Login Page
Test Teardown    Close Browser

*** Test Cases ***
Login Success
    ${user}=    Set Variable    ${USERS_SUCCESS}[standard]
    Login Using Bundle    ${user}
    Verify Login Success
    LOGOUT
    Verify Logout

Login Locked User
    ${user}=    Set Variable    ${USERS_FAILED}[locked]
    Login Using Bundle    ${user}
    Verify Failed Using Bundle    ${user}
    

