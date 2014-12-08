node[:deploy].each do |application, deploy|
 	python "chatdemo.py" do
		cwd "#{deploy[:deploy_to]}/current"
		only_if { ::File.exists?("#{deploy[:deploy_to]}/current/chatdemo.py") }
	end 
end