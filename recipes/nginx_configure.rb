tornados = search(:node, "role:tornado")
Chef::Log.warn("I got Tornados '#{tornados}'")

template "/etc/nginx/sites-available/websockets.conf" do
  source "websockets.conf.erb"
  mode '0644'
  variables(
    :tornados => tornados
  )
end

link "/etc/nginx/sites-enabled/websockets.conf" do
  to '/etc/nginx/sites-available/websockets.conf'
end