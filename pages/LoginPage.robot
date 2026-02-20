*** Settings ***
Library    SeleniumLibrary
Variables  ../variables/login.py
Variables   ../variables/env.py

*** Variables ***
${USERNAME_FIELD}    id=user-name
${PASSWORD_FIELD}    id=password
${LOGIN_BTN}         id=login-button
${PRODUCTS_TITLE}    css=.title
${ERROR_MSG}         css=.error-message-container
${OPTION_BTN}          css=#react-burger-menu-btn
${LOGOUT_BTN}          css=#logout_sidebar_link

*** Keywords ***
Open Login Page
    Open Browser    ${URL}   chrome    options=add_argument("--incognito"); add_argument("--disable-cache")
    Maximize Browser Window

Login Using Bundle
    [Arguments]    ${user}
    Input Text    ${USERNAME_FIELD}    ${user}[username]
    Input Text    ${PASSWORD_FIELD}    ${user}[password]
    Click Element    ${LOGIN_BTN}

lOGIN SETUP
    Open Login Page
    Login Using Bundle    ${USERS_SUCCESS}[standard]
    Verify Login Success
    
LOGOUT
    wait until element is visible    ${OPTION_BTN}    
    Click Element    ${OPTION_BTN}
    wait until element is visible   ${LOGOUT_BTN}
    Click Element    ${LOGOUT_BTN}

Verify Login Success
    Wait Until Element Is Visible    ${PRODUCTS_TITLE}
    Element Text Should Be           ${PRODUCTS_TITLE}    Products

Verify Failed Using Bundle
    [Arguments]    ${user}
    Wait Until Element Is Visible    ${ERROR_MSG}
    Element Should Contain           ${ERROR_MSG}    ${user}[error]

Verify Logout
    Wait Until Element Is Visible    ${LOGIN_BTN}
    Element Should Be Visible           ${LOGIN_BTN}


Close Session
    Close Browser