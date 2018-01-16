# Data used by the test
# Format is $Name (Server Name), $port (port to check), $expected (false if closed and true if opened)
$data = @(
    @{ Name = 'localhost'; Port = '3389'; Expected = $true }
    @{ Name = 'localhost'; Port = '80'; Expected = $false }
    @{ Name = 'localhost'; Port = '551'; Expected = $false }
)

# DNS Resolution pester tests 
Describe 'Test-Port' {
  Context "Testing Port" {
    It "Given valid -Name '<Name>' and -Port <Port>, it returns '<Expected>'" -TestCases $data {
      param ($Name, $Port, $Expected)
      $check = Test-NetConnection -ComputerName $Name -Port $Port
      $check.TcpTestSucceeded | Should -Be $Expected
    }
  }
}
