*** Settings ***
Library     SeleniumLibrary
Resource    ../pages/cartPage.robot
Resource    ../pages/LoginPage.robot

Test Setup     LOGIN SETUP
Test Teardown   Close Session

*** Test Cases ***
Add product to cart and validate
    Click Add To Cart    backpack
    Verify Cart Count    1
    Open Cart
    check product in cart    backpack

Add Two Products And Validate In Cart
    Click Add To Cart    backpack
    Click Add To Cart    bike_light
    Verify Cart Count    2
    Open Cart
    check products in cart multiple    backpack    bike_light
    Click Button    ${CHECKOUT_BTN}