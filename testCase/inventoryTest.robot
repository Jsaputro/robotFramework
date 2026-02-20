*** Settings ***
Library     SeleniumLibrary
Resource    ../pages/InventoryPage.robot
Resource    ../pages/LoginPage.robot
Resource    ../pages/ProductPage.robot

Test Setup     LOGIN SETUP
Test Teardown   Close Session

*** Test Cases ***
Add Backpack To Cart
    Click Add To Cart    backpack
    Verify Cart Count    1


click product image
    Click Product Image    backpack
    Verify Product Details    backpack    


Remove Product
    Click Add To Cart      backpack
    Verify Cart Count    1
    Click Remove Product   backpack