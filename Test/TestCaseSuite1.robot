*** Settings ***
Library    SeleniumLibrary     

Suite Setup    Log    Test Suite Set-up
Suite Teardown    Log    Test Suite Tear-Down

Test Setup    Log    Test Case Set-up
Test Teardown    Log    Test Case Tear-Down


Default Tags    sanity 

*** Test Cases ***
MyFirstTestCase
    Log    Hello World    
    
FirstSeleniumTest
    #Create Webdriver    Chrome    executable_path=E:\\Learning\\SeleniumBrowserDrivers\\chromedriver_win32_ChromeV84\\chromedriver.exe
        
    Open Browser    https://google.com    gc
    Set Browser Implicit Wait    5
    Input Text    name=q    Automation Step by Step  
    Press Keys    name=q    ENTER 
    # Click Button    name=btnK
    Sleep    5      
    Close Browser
    Log    Test Completed
    
SampleLoginTest
    [Documentation]    This is Sample Login test
    
    Open Browser     https://opensource-demo.orangehrmlive.com/    Chrome
    Set Browser Implicit Wait    5
    Input Text       id=txtUsername    admin
    Input Text       id=txtPassword    admin123
    Click Button     id=btnLogin  
    Click Element    id=welcome    
    Click Element    link=Logout   
    Sleep            2 
    Close Browser
    Log              Test Completed
   
 
SampleLoginTestWithVeriables
    [Documentation]    This is Sample Login test
    
    Open Browser     ${URL}    Chrome
    Set Browser Implicit Wait    5
    Input Text       id=txtUsername    ${CREDENTIALS}[0]
    Input Text       id=txtPassword    ${LOGINDATA}[password]
    Click Button     id=btnLogin  
    Click Element    id=welcome    
    Click Element    link=Logout   
    Sleep            2 
    Close Browser
    Log              Test Completed
    Log              This test was executed by %{username} on %{os}
    

SampleLoginTestWithVeriablesAndKeywords
    [Documentation]    This is Sample Login test
    
    Open Browser     ${URL}    Chrome
    Set Browser Implicit Wait    5
    LoginKw
    Click Element    id=welcome    
    Click Element    link=Logout   
    Sleep            2 
    Close Browser
    Log              Test Completed
    Log              This test was executed by %{username} on %{os}
    


*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/
@{CREDENTIALS}    Admin    admin123
&{LOGINDATA}    username=Admin    password=admin123


*** Keywords ***
LoginKw
    [Documentation]    Created User Keyword for Learning purpose
    Input Text       id=txtUsername    ${CREDENTIALS}[0]
    Input Text       id=txtPassword    ${LOGINDATA}[password]
    Click Button     id=btnLogin  

   