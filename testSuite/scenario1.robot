*** Settings ***
Library     SeleniumLibrary
Resource    ../pages/InventoryPage.robot
Resource    ../pages/LoginPage.robot
Resource    ../pages/ProductPage.robot
Resource    ../pages/cartPage.robot
Resource    ../pages/checkoutPage.robot

Test Setup     Open Login Page
Test Teardown   Close Session

*** Keywords ***
Login Success
    ${user}=    Set Variable    ${USERS_SUCCESS}[standard]
    Login Using Bundle    ${user}
    Verify Login Success

*** Test Cases ***
1.1 Login Feature Success
    Login Success

1.2 Login Feature Locked User
     ${user}=    Set Variable    ${USERS_FAILED}[locked]
    Login Using Bundle    ${user}
    Verify Failed Using Bundle    ${user}

2. Add Product and Validate detail product
    Login Success
    Click Add To Cart    backpack
    Verify Cart Count    1
    Open Cart
    check product in cart    backpack

3. Add to Cart and Validate in Cart
    Login Success
    Click Add To Cart    backpack
    Click Add To Cart    bike_light
    Verify Cart Count    2
    Open Cart
    check products in cart multiple    backpack    bike_light
    Click Button    ${CHECKOUT_BTN}

4.1 Checkout Success
    Login Success 
    Click Add To Cart    backpack
    Verify Cart Count    1
    Open Cart
    check product in cart    backpack
    Click Button    ${CHECKOUT_BTN}
    Fill User Info     Jodi
    Click Continue
    Click Finish
    verify checkout complete

4.2 Checkout with missing first name
    Login Success
    Click Add To Cart    backpack
    Verify Cart Count    1
    Open Cart
    check product in cart    backpack
    Click Button    ${CHECKOUT_BTN}
    Fill User Info     MissingFirstName
    Click Continue
    Page Should Contain    Error: First Name is required

5. Logout success and validate login Page
    Login Success
    LOGOUT
    Verify Logout 