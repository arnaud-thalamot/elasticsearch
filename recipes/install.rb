########################################################################################################################
#                                                                                                                      #
#                                  Elastic Search Cookbook                        											               #
#                                                                                                                      #
#   Language            : Chef/Ruby                                                                                    #
#   Date                : 11/28/2017                                                                                   #
#   Date Last Update    : 11/28/2017                                                                                   #
#   Version             : 1.0                                                                                          #
#   Author              : Arnaud Thalamot                                                                              #
#                                                                                                                      #
########################################################################################################################

#Windows Beats
if platform_family?('windows')
end

#Linux Beats
if platform_family?('rhel')

    remote_file '/tmp/elasticsearch-7.1.0-x86_64.rpm' do
        source 'https://client.com/ibm/chef-client/elasticsearch-7.3.2-x86_64.rpm'
        owner 'root'
        group 'root'
        mode '0755'
        action :create_if_missing
    end

    # Install metricbeats rpm
    execute 'install_elastic' do
        command 'rpm -ivh /tmp/elasticsearch-7.1.0-x86_64.rpm'
        action :run
        only_if { shell_out("rpm -qa elasticsearch").stdout == ''}
    end

    service 'elasticsearch' do
      supports :status => true
      action [ :enable, :start ]
    end

    # copy the powershell script to node system
      cookbook_file node['tscm']['copy_script_path'].to_s do
        source 'copy_script.ps1'
        owner 'root'
        group 'root'
        mode '750'
        action :create
      end
end