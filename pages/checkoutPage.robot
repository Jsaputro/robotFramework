*** Settings ***
Library     SeleniumLibrary
Resource   ../pages/cartPage.robot
variables  ../variables/userCheckout.py

*** Variables ***
${FIRST_NAME_INPUT}   css=[data-test="firstName"]
${LAST_NAME_INPUT}    css=[data-test="lastName"]
${POSTAL_CODE_INPUT}  css=[data-test="postalCode"]    
${CONTINUE_BTN}   css=[data-test="continue"]
${FINISH_BTN}     css=[data-test="finish"]    

*** Keywords ***
Get User Checkout Data
    [Arguments]    ${user_checkout}
    ${data}=    Set Variable    ${USERS_CHECKOUT}[${user_checkout}]
    RETURN    ${data}

Fill User Info 
    [Arguments]    ${user_checkout}
    ${data}=    Get User Checkout Data    ${user_checkout}
    Input Text    ${FIRST_NAME_INPUT}     ${data}[first_name]
    Input Text    ${LAST_NAME_INPUT}      ${data}[last_name]
    Input Text    ${POSTAL_CODE_INPUT}    ${data}[postal_code]

Click Continue
    Click Button   ${CONTINUE_BTN}

Click Finish
    Click Button   ${FINISH_BTN}

verify checkout complete
    Page Should Contain    Thank you for your order!
