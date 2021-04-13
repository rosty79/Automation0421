*** Settings ***
Library           ExcelLibrary

*** Variables ***
${Count}          ${EMPTY}
@{Count1}

*** Test Cases ***
ExcelTC_01
    ExcelLibrary.Close All Excel Documents

ReadExcelDemo
    Open Excel    C:/Robot Projects/Demo/Demo.xls
    Check Cell Type    Sheet1    2    1
    ${Count}    Get Column Count    Sheet1
    ${Count1}    Get Column Values    Sheet1    2
