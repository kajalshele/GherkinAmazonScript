*** Settings ***
Documentation    This is some basic info about the whole suite

Resource    ../Resources/AmazonApp.robot
Resource    ../Resources/Common.robot
Test Setup    Begin Web Tests
Test Teardown    End Web Tests

*** Variables ***

*** Test Cases ***
Logged out user can search for product
    [Tags]    smoke
    Given User is not logged in
    And User searches for product
    Then Search result contain relevant product


Logged out user can view product
    [Tags]    smoke
    Given User is not logged in
    And User searches for product
    And Search result contain relevant product
    Then User selects product from results



Logged out user can add product to cart
    [Tags]    smoke
    Given User is not logged in
    And User searches for product
    And Search result contain relevant product
    And User selects product from results
    And User Choose Location
    And User add product to cart
    Then Product is present in the cart

Logged out user must sign in to check out
    [Tags]    smoke
    Given User is not logged in
    And User searches for product
    And Search result contain relevant product
    And User selects product from results
    And User Choose Location
    And User add product to cart
    And Product is present in the cart
    And User attempts to checkout
    Then User should sign in



