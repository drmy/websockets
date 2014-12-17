tornados = search(:node, "role:tornado")

template "/etc/nginx/sites-available/websockets.conf" do
  source "websockets.conf.erb"
  mode '0644'
  variables(
    :tornados => tornados
    :public_ip => node[:opsworks][:instance][:ip]
  )
  notifies :reload, "service[nginx]", :immediately
end

link "/etc/nginx/sites-enabled/websockets.conf" do
  to '/etc/nginx/sites-available/websockets.conf'
  not_if { ::File.exists?("/etc/nginx/sites-enabled/websockets.conf") }
end

service "nginx" do
  supports :status => true, :restart => true, :reload => true
end