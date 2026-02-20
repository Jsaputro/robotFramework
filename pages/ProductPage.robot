*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    InventoryPage.robot
Variables   ../variables/product.py


*** Variables ***

# ===== PRODUCT =====
${PRODUCT_NAME_LOC}      css=.inventory_details_name
${ADD_TO_CART}       css=[data-test="add-to-cart"]

# ===== STATIC =====
${PRODUCT_PRICE_LOC}        css=[data-test="inventory-item-price"]

*** Keywords ***
Verify Product Details
    [Arguments]    ${product}
    ${data}=    Get Product Data    ${product}
    ${id}=       Set Variable    ${data}[id]
    ${name}=     Set Variable    ${data}[name]
    ${price}=    Set Variable    ${data}[price]
    ${locator}=     Set Variable    ${data}[locator]

    Element Should Contain    ${PRODUCT_NAME_LOC}    ${name}
    Element Should Contain   ${PRODUCT_PRICE_LOC}    ${price}
    Wait Until Element Is Visible    ${ADD_TO_CART}