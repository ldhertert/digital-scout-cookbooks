directory "#{Chef::Config[:file_cache_path]}/hsgc/" do
  action :create
end

powershell_script "Download artifact" do
	code "Read-S3Object -BucketName digitalscout-build -Key artifacts/archive.zip -File '#{Chef::Config[:file_cache_path]}/hsgc/artifacts.zip'"
end

powershell_script "Unzip artifact" do 
	code " & 'C:\\Program Files\\7-Zip\\7z.exe' x '#{Chef::Config[:file_cache_path]}\\hsgc\\artifacts.zip' -o#{Chef::Config[:file_cache_path]}\\hsgc\\artifacts -r -y"
end

#create website if needed
#run GameCenter.Web.cmd /Y