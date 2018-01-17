# Description

Sample test scripts using Pester.

## Pre-requisite

Install Pester : https://github.com/pester/Pester

You can also take a look at the Setup folder which has a script to setup powershell on Linux RHEL 7.2

If you want to integrated it with Pester, Pester must be installed on each teamCity Agent server.

## Sample pester tests 

To execute the test manually, just run the test scripts from a powershell window.

# Creating a build Step in TeamCity 

Pester must be invoked with the adequate parameter to output the result of the test in a format that can be ingested by TeamCity.

For example, you can add the following in the script source of a build step in TeamCity : 

`echo "Testing..."
Invoke-Pester -OutputFile "/opt/teamcity/Build-Output/test.xml" -OutputFormat NUnitXml`


## JaCoCo

To export the test in a JaCoCo format (for integration with your CI build server), Run : 

`Invoke-Pester -OutputFile Test.xml -OutputFormat NUnitXml`

Here is an example of the output : 

```<?xml version="1.0" encoding="utf-8" standalone="no"?>
<test-results xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="nunit_schema_2.5.xsd" name="Pester" total="3" errors="0" failures="0" not-run="0" inconclusive="0" ignored="0" skipped="0" invalid="0" date="2018-01-16" time="06:26:29">
  <environment user="Administrator" machine-name="EC2AMAZ-TPFLURH" cwd="C:\CBA\Automated-Tests\Functions" user-domain="EC2AMAZ-TPFLURH" platform="Microsoft Windows Server 2016 Datacenter|C:\Windows|\Device\Harddisk0\Partition1" nunit-version="2.5.8.0" os-version="10.0.14393" clr-version="4.0.30319.42000" />
  <culture-info current-culture="en-US" current-uiculture="en-US" />
  <test-suite type="TestFixture" name="Pester" executed="True" result="Success" success="True" time="6.9031" asserts="0" description="Pester">
    <results>
      <test-suite type="TestFixture" name=".\Port.Tests.ps1" executed="True" result="Success" success="True" time="6.9031" asserts="0" description=".\Port.Tests.ps1">
        <results>
          <test-suite type="TestFixture" name="Test-Port" executed="True" result="Success" success="True" time="6.9031" asserts="0" description="Test-Port">
            <results>
              <test-suite type="TestFixture" name="Testing Port" executed="True" result="Success" success="True" time="6.9031" asserts="0" description="Testing Port">
                <results>
                  <test-suite type="ParameterizedTest" name="Test-Port.Testing Port.Given valid -Name '&lt;Name&gt;' and -Port &lt;Port&gt;, it returns '&lt;Expected&gt;'" executed="True" result="Success" success="True" time="6.9031" asserts="0" description="Given valid -Name '&lt;Name&gt;' and -Port &lt;Port&gt;, it returns '&lt;Expected&gt;'">
                    <results>
                      <test-case description="Given valid -Name 'localhost' and -Port 3389, it returns 'True'" name="Test-Port.Testing Port.Given valid -Name 'localhost' and -Port 3389, it returns 'True'" time="1.0727" asserts="0" success="True" result="Success" executed="True" />
                      <test-case description="Given valid -Name 'localhost' and -Port 80, it returns 'False'" name="Test-Port.Testing Port.Given valid -Name 'localhost' and -Port 80, it returns 'False'" time="2.9078" asserts="0" success="True" result="Success" executed="True" />
                      <test-case description="Given valid -Name 'localhost' and -Port 551, it returns 'False'" name="Test-Port.Testing Port.Given valid -Name 'localhost' and -Port 551, it returns 'False'" time="2.9226" asserts="0" success="True" result="Success" executed="True" />
                    </results>
                  </test-suite>
                </results>
              </test-suite>
            </results>
          </test-suite>
        </results>
      </test-suite>
    </results>
  </test-suite>
</test-results>```
