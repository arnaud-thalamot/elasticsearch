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

    service 'elasticsearch' do
      action [ :disable, :stop ]
    end

    service 'kibana' do
      action [ :disable, :stop ]
    end

    service 'logstash' do
      action [ :disable, :stop ]
    end

    # Install metricbeats rpm
    execute 'remove_elastic' do
        command 'rpm -e elasticsearch'
        action :run
        not_if { shell_out("rpm -qa elasticsearch").stdout == ''}
    end

    # Install metricbeats rpm
    execute 'remove_kibana' do
        command 'rpm -e kibana'
        action :run
        not_if { shell_out("rpm -qa kibana").stdout == ''}
    end

    # Install metricbeats rpm
    execute 'remove_logstash' do
        command 'rpm -e logstash'
        action :run
        not_if { shell_out("rpm -qa logstash").stdout == ''}
    end

    directory '/etc/elasticsearch' do
      recursive true
      action :delete
    end

    directory '/etc/kibana' do
      recursive true
      action :delete
    end

    directory '/etc/logstash' do
      recursive true
      action :delete
    end

    directory '/var/lib/elasticsearch' do
      recursive true
      action :delete
    end

    directory '/var/lib/kibana' do
      recursive true
      action :delete
    end

    directory '/var/lib/logstash' do
      recursive true
      action :delete
    end

    directory '/usr/share/elasticsearch' do
      recursive true
      action :delete
    end

    directory '/usr/share/kibana' do
      recursive true
      action :delete
    end

    directory '/usr/share/logstash' do
      recursive true
      action :delete
    end

    directory '/var/log/elasticsearch' do
      recursive true
      action :delete
    end

    directory '/var/log/kibana' do
      recursive true
      action :delete
    end

    directory '/var/log/logstash' do
      recursive true
      action :delete
    end
end