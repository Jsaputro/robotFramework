*** Settings ***
Library     SeleniumLibrary
Library     String
Variables   ../variables/product.py


*** Variables ***
${NAVIGATION_LOC}        css=[data-test="%s"]
${ADD_TO_CART_BTN}       css=#add-to-cart-
${REMOVE_PRODUCT_BTN}    css=#remove-
${PRODUCT_IMAGE_LOC}     css=#item_

${CART}                css=[data-test="shopping-cart-link"]
${OPTION_BTN}          css=#react-burger-menu-btn
${LOGOUT_BTN}          css=#logout_sidebar_link
${BACK_TO_PRODUCT}     css=#back-to-products
${CART_COUNT}          css=[data-test="shopping-cart-badge"]


*** Keywords ***
Get Product Data
    [Arguments]    ${product}
    ${data}=    Set Variable    ${PRODUCTS}[${product}]
    RETURN    ${data}

Click Product Image
    [Arguments]    ${product}
    ${data}=    Get Product Data    ${product}
    ${id}=       Set Variable    ${data}[id]
    Wait Until Page Contains Element    ${PRODUCT_IMAGE_LOC}${id}_img_link
    Click element   ${PRODUCT_IMAGE_LOC}${id}_img_link


Click Add To Cart
    [Arguments]    ${product}
    ${data}=    Get Product Data    ${product}
    ${locator}=       Set Variable    ${data}[locator]
    Wait Until Page Contains Element    ${ADD_TO_CART_BTN}${locator}
    Click Element    ${ADD_TO_CART_BTN}${locator}

Click Remove Product
    [Arguments]    ${product}
    ${data}=    Get Product Data    ${product}
    ${locator}=       Set Variable    ${data}[locator]
    Wait Until Page Contains Element    ${REMOVE_PRODUCT_BTN}${locator}
    Click Element    ${REMOVE_PRODUCT_BTN}${locator}

Open Cart
    Click Element    ${CART}

Verify Cart Count
    [Arguments]    ${count}
    Wait Until Element Contains    ${CART_COUNT}    ${count}
