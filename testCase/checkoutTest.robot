*** Settings ***
Library     SeleniumLibrary
Resource    ../pages/checkoutPage.robot
Resource    ../pages/LoginPage.robot

Test Setup     LOGIN SETUP
Test Teardown   Close Session

*** Keywords ***
Add product to cart and validate
    Click Add To Cart    backpack
    Verify Cart Count    1
    Open Cart
    check product in cart    backpack
    Click Button    ${CHECKOUT_BTN}

*** Test Cases ***
Checkout with valid user data
    Add product to cart and validate
    Fill User Info     Jodi
    Click Continue
    Click Finish
    verify checkout complete

checkout with missing user data
    Add product to cart and validate
    Fill User Info     MissingFirstName
    Click Continue
    Page Should Contain    Error: First Name is required
