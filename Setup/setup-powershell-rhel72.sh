# Setup powershell 6.0 on RHEL 7.2
# Instruction copied from : https://github.com/PowerShell/PowerShell/blob/master/docs/installation/linux.md

# Register the Microsoft RedHat repository
curl https://packages.microsoft.com/config/rhel/7/prod.repo | sudo tee /etc/yum.repos.d/microsoft.repo

# Install PowerShell
echo "Setting up Powershell now..."
sudo yum install -y powershell

# Setup Pester
echo "Setting up Pester now..."
sudo pwsh -Command "& {Install-Module -Name Pester -Force -SkipPublisherCheck}"
