# Data used by the test
# Format is Name, Expected (True if it should be reachable, false otherwise)
$data = @(
    @{ Name = 'www.google.com'; Expected = $true }
    @{ Name = 'www.amazon.com'  ; Expected = $true }
    @{ Name = 'www.invalid.co2m'  ; Expected = $false }
)

# Test function used to resolve DnsName 
function Test-ResolveDnsName { 
    param( [string]$Name )

    $lastError = $error[0]
    Try {
        $result =  [System.Net.Dns]::GetHostEntry($Name)
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

# DNS Resolution pester tests 
Describe 'Test-ResolveDnsName' {
  Context "Testing DNS Resolution" {
    It "Given valid -Name '<Name>', it returns '<Expected>'" -TestCases $data {
      param ($Name, $Expected)
      $check = Test-ResolveDnsName -Name $($Name) -ErrorAction "SilentlyContinue"
      $check | Should -Be $Expected
    }
  }
}
