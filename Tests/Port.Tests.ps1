# Data used by the test
# Format is $Name (Server Name), $port (port to check), $expected (false if closed and true if opened)
$data = @(
    @{ Name = 'localhost'; Port = '222'; Expected = $false }
    @{ Name = 'localhost'; Port = '80'; Expected = $true }
    @{ Name = 'localhost'; Port = '551'; Expected = $false }
)

# Test function used to resolve DnsName 
function Test-TCPPort { 
    param( [string]$Name, [int]$Port )

    $lastError = $error[0]
    Try {
       $tcpClient = New-Object System.Net.Sockets.TCPClient
       $tcpClient.Connect($Name, $Port)
    } Catch {
        return $false
    }
    
    # Check if there is a new error
    if ($lastError -ne $error[0]) {         
        return $false
    } else { 
        return $tcpClient.Connected
    }
}

# Port pester tests 
Describe 'Test-Port' {
  Context "Testing Port" {
    It "Given valid -Name '<Name>' and -Port <Port>, it returns '<Expected>'" -TestCases $data {
      param ($Name, $Port, $Expected)
      $check = Test-TCPPort -Name $Name -Port $Port -ErrorAction "SilentlyContinue"
      $check | Should -Be $Expected
    }
  }
}
