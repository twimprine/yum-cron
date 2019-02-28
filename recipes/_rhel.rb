#
# Cookbook Name:: yum-cron
# Recipe:: default
# Author:: Oregon State University (<chef@osuosl.org>)
#
# Copyright (C) 2015 Oregon State University
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.



# RHEL doesn't have the yum-cron package in the default repos
# so we need to enable the optional RHEL repo here

case node['platform_version'].split('.')[0]
when '6'
  bash 'register' do
    user 'root'
    cwd '/tmp'
    code <<-EOH
    subscription-manager repos --enable rhel-6-server-optional-rpms
    EOH
  end
when '7'
  bash 'register' do
    user 'root'
    cwd '/tmp'
    code <<-EOH
    subscription-manager repos --enable rhel-7-server-optional-rpms
    EOH
  end
end
