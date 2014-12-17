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

  execute "run_demo" do
	command "#{deploy[:deploy_to]}/current/chatdemo.py"
	user deploy[:user]
    group deploy[:group]
	only_if { ::File.exists?("#{deploy[:deploy_to]}/current/chatdemo.py") }
  end
end