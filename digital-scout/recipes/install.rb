include_recipe 'chocolatey'

windows_feature 'IIS-WebServerRole' do
  action :install
end

windows_feature 'IIS-WebServerManagementTools' do
  action :install
  all true
end

windows_feature 'IIS-NetFxExtensibility45' do
  action :install
end

windows_feature 'IIS-ASPNET45' do
  action :install
end

windows_feature 'HttpCompressionDynamic' do
  action :install
end

chocolatey 'UrlRewrite'

#powershell_script 'Install Chocolatey' do
#	code  <<-EOH
#	iex ((new-object net.webclient).DownloadString("https://chocolatey.org/install.ps1"))
#	$env:Path = "$($env:PATH);$($env:ALLUSERSPROFILE)\chocolatey\bin"
#	EOH
#	only_if '(get-command "choco.exe" -ErrorAction SilentlyContinue) -eq $null'
#end

#powershell_script 'Install URL Rewrite' do
#	code 'choco install UrlRewrite -y'
#	#only_if '(choco list -localonly | Select-String "UrlRewrite") -eq $null'
#end

#powershell_script 'Install Web Deploy' do
#	code 'choco install WebDeploy -y'
	#only_if '(choco list -localonly | Select-String "WebDeploy") -eq $null'
#end

#powershell_script 'Install Sublime Text 3' do
#	code 'choco install SublimeText3 -y'
	#only_if '(choco list -localonly | Select-String "SublimeText3") -eq $null'
#end

#powershell_script 'Install 7zip' do
#	code 'choco install 7zip.install -y'
	#only_if '(choco list -localonly | Select-String "7zip.install") -eq $null'
#end