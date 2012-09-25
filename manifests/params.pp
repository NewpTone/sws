class sws::params{
  #this contains the _basic_ common configuration
  /* ---------------Important to set!------------------*/
  $admin_email          = 'admin@sws.com'
  $admin_password	= 'admin_pass' 
  $auto_assign_floating_ip 	= false
  $controller_node_address 	= '192.168.56.3'
  $controller_node_internal	= $controller_node_address
  $export_resources     = false
  $floating_range       = '192.168.56.128/25'
  $fixed_range          = '10.0.0.0/24'
  $glance_api_servers	= "${controller_node_internal}:9292"
  $glance_db_password   = 'glance_pass'
  $glance_user_password = 'glance_pass'
  $internal_address	= $controller_node_internal
  $keystone_admin_token	= 'keystone_pass'
  $keystone_db_password = 'keystone_db_password'
  $libvirt_type       	= 'kvm'
  $manage_volumes     	= true
  $multi_host           = true
  $mysql_root_password  = 'mysql_root_password'
  $network_manager      = 'nova.network.manager.FlatDHCPManager'
  $nova_db_password 	= 'nova_pass'
  $nova_user_password   = 'nova_pass'
  $nova_volume        	= 'nova-volumes'
  $rabbit_host        	=> $controller_node_internal
  $rabbit_password      = 'rabbit_pass'
  $rabbit_user          = 'rabbit_user'
  $public_address	= $controller_node_public
  $public_interface	= 'eth0'
  $private_interface	= 'eth1'
  $sql_connection	= "mysql://nova:${nova_db_password}@${controller_node_internal}/nova"
  $verbose              = true
  $vncproxy_host      	= $controller_node_public
  $vnc_enabled        	= true 
  /* --------------------------------------------------*/
}
