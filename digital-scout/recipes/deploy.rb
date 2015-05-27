directory '#{Chef::Config[:file_cache_path]}/hsgc/' do
  action :create
end

remote_file '#{Chef::Config[:file_cache_path]}/hsgc/artifacts.zip' do
  source "http://build.digitalscout.com:8080/job/GameCenterProduction/lastSuccessfulBuild/artifact/*zip*/archive.zip"
end

powershell_script "Unzip artifact" do 
	code ' & "C:\Program Files\7-Zip\7z.exe" x "#{Chef::Config[:file_cache_path]}/hsgc/artifacts.zip" -o#{Chef::Config[:file_cache_path]}/hsgc/artifacts" -r -y'
end