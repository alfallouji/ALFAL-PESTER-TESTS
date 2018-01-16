# Description

Sample test scripts using Pester.

## Pre-requisite

Install Pester : https://github.com/pester/Pester

## Sample pester tests 

To execute the test manually, just run the test scripts from a powershell window.

## JaCoCo

To export the test in a JaCoCo format (for integration with your CI build server), Run : 

`Invoke-Pester -OutputFile Test.xml -OutputFormat NUnitXml`
