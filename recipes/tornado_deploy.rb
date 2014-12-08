node[:deploy].each do |application, deploy|
 	python "chatdemo.py" do
		cwd "#{deploy[:deploy_to]}/current"
	end 
end