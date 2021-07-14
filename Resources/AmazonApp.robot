*** Settings ***
Resource    ../Resources/PO/Cart.robot
Resource    ../Resources/PO/LandingPage.robot
Resource    ../Resources/PO/Product.robot
Resource    ../Resources/PO/SearchResult.robot
Resource    ../Resources/PO/SignIn.robot
Resource    ../Resources/PO/TopNav.robot


*** Keywords ***
User is not logged in
    log    Check to see whether user is logged in

User searches for product
    LandingPage.Load
    TopNav.Search for product

Search result contain relevant product
    SearchResult.Verify search is completed

User selects product from results
    SearchResult.Click product link
    Product.Verify product is loaded

User choose location
    Product.Select appropriate location

User add product to cart
    Product.Verify add to cart button is enable
    Product.Add product to cart

Product is present in the cart
    Cart.Verify product is added

User attempts to checkout
    Cart.Proceed to checkout

User should sign in
    SignIn.Verify sign in page is loaded

