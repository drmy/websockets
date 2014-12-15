include_recipe 'deploy'

node[:deploy].each do |application, deploy|
  opsworks_deploy_dir do
    user deploy[:user]
    group deploy[:group]
    path deploy[:deploy_to]
  end

  opsworks_deploy do
    deploy_data deploy
    app application
  end

  python "chatdemo.py" do
	cwd "#{deploy[:deploy_to]}/current"
	only_if { ::File.exists?("#{deploy[:deploy_to]}/current/chatdemo.py") }
  end
end