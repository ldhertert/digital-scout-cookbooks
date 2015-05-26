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
  all true
end

windows_feature 'IIS-ASPNET45' do
  action :install
  all true
end

windows_feature 'IIS-HttpCompressionDynamic' do
  action :install
end

chocolatey 'UrlRewrite'
chocolatey 'WebDeploy'
chocolatey 'SublimeText3'
chocolatey '7zip.install'
chocolatey 'googlechrome'

windows_package 'Install New Relic .NET Agent' do
	source "http://download.newrelic.com/dot_net_agent/release/NewRelicDotNetAgent_x64.msi"
	options "/qb NR_LICENSE_KEY=#{node['newrelic']['licensekey']} INSTALLLEVEL=1"
	installer_type :msi
	action :install
	not_if { ::File.exist?('C:\\Program Files\\New Relic\\.NET Agent') }
end

windows_package 'Install New Relic Server Monitoring Agent' do
	source "http://download.newrelic.com/windows_server_monitor/release/NewRelicServerMonitor_x64_3.3.3.0.msi"
	options "/L*v install.log /qn NR_LICENSE_KEY=#{node['newrelic']['licensekey']}"
	installer_type :msi
	action :install
	not_if { ::File.exist?('C:\\Program Files\\New Relic\\Server Monitor') }
end

#this shouldn't be necessary, because it's required by opsworks, but the "update custom cookbooks is failing due to git not being accessible"
powershell_script "Add git to path" do
	code '[Environment]::SetEnvironmentVariable("Path", [Environment]::GetEnvironmentVariable("Path", "Machine") + ";C:\ProgramData\Git\bin", "Machine")'
	not_if '[Environment]::GetEnvironmentVariable("Path", "Machine").ToLower().Contains("git\bin")'
end