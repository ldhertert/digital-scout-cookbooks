powershell_script 'Install IIS' do
  code 'Add-WindowsFeature Web-Server'
  not_if "(Get-WindowsFeature -Name Web-Server).Installed"
end

powershell_script 'Install Web Management Tools' do
  code 'Add-WindowsFeature Web-Mgmt-Tools -IncludeAllSubFeature'
  not_if "(Get-WindowsFeature -Name Web-Mgmt-Tools).Installed"
end

powershell_script 'Install Web Management Tools' do
  code 'Add-WindowsFeature Web-Mgmt-Tools -IncludeAllSubFeature'
  not_if "(Get-WindowsFeature -Name Web-Mgmt-Tools).Installed"
end

powershell_script 'Install Web-Net-Ext45' do
	code 'Install-WindowsFeature Web-Net-Ext45'
	not_if "(Get-WindowsFeature -Name Web-Net-Ext45).Installed"
end

powershell_script 'Install Web-Asp-Net45' do
	code 'Install-WindowsFeature Web-Asp-Net45'
	not_if "(Get-WindowsFeature -Name Web-Asp-Net45).Installed"
end	

powershell_script 'Install Dynamic Compression' do
	code 'Install-WindowsFeature Web-Dyn-Compression'
	not_if "(Get-WindowsFeature -Name Web-Dyn-Compression).Installed"
end	

powershell_script 'Install Chocolatey' do
	code 'iex ((new-object net.webclient).DownloadString("https://chocolatey.org/install.ps1"))'
	only_if '(get-command "choco.exe" -ErrorAction SilentlyContinue) -eq $null'
end

powershell_script 'Install URL Rewrite' do
	code 'choco install UrlRewrite'
	only_if '(choco list -localonly | Select-String "UrlRewrite") -eq $null'
end

powershell_script 'Install Web Deploy' do
	code 'choco install WebDeploy'
	only_if '(choco list -localonly | Select-String "WebDeploy") -eq $null'
end

powershell_script 'Install Sublime Text 3' do
	code 'choco install SublimeText3'
	only_if '(choco list -localonly | Select-String "SublimeText3") -eq $null'
end

powershell_script 'Install 7zip' do
	code 'choco install 7zip.install'
	only_if '(choco list -localonly | Select-String "7zip.install") -eq $null'
end