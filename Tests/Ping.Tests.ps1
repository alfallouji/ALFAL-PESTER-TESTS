# Data used by the test
# Format is $Name (Server Name), $expected (false if closed and true if opened)
$data = @(
    @{ Name = 'localhost'; Expected = $true }
    @{ Name = 'localhost23'; Expected = $false }
    @{ Name = 'localhost44'; Expected = $false }
)

# Test function used to ping 
function Test-Ping { 
    param( [string]$Name )

    $lastError = $error[0]
    Try {
        $ping = New-Object System.Net.NetworkInformation.Ping;
        $result = $ping.Send($Name)
    } Catch {
        return $false
    }
    
    # Check if there is a new error
    if ($lastError -ne $error[0]) {         
        return $false
    } else { 
        return $true
    }
}

# Ping pester tests 
Describe 'Test-Ping' {
  Context "Testing Ping" {
    It "Given valid -Name '<Name>', it returns '<Expected>'" -TestCases $data {
      param ($Name, $Expected)
      $check = Test-Ping -Name $Name 
      $check | Should -Be $Expected
    }
  }
}
