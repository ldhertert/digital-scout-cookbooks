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

windows_feature 'IIS-HttpCompressionDynamic' do
  action :install
end

chocolatey 'UrlRewrite'
chocolatey 'WebDeploy'
chocolatey 'SublimeText3'
chocolatey '7zip.install'
chocolatey 'googlechrome'

chocolatey 'newrelic-dotnet' do
	args 'licensekey=df77750758d88ba07d962482cb3a6939c9309e23'
end
