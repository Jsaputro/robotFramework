*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    InventoryPage.robot

*** Variables ***
${CART_ITEM_NAME}    css=.inventory_item_name
${CHECKOUT_BTN}   css=[data-test="checkout"]

*** Keywords ***
check product in cart
    [Arguments]    ${product}
    ${data}=    Get Product Data    ${product}
    ${name}=    Set Variable    ${data}[name]
    Page Should Contain    ${name}

check products in cart multiple
    [Arguments]    @{products}
    FOR    ${product}    IN    @{products}
        check product in cart    ${product}
    END