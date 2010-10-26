#
# Cookbook Name:: yumrepo
# Recipe:: dell
#
# Copyright 2010, Eric G. Wolfe
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

case node[:platform] when "redhat","centos"

  if node[:platform_version].to_f >= 5

    if node[:repo][:dellomsa][:enabled]
      template "/etc/yum.repos.d/dell-omsa-repository.repo" do
        mode "0644"
        source "dell-omsa-repository.repo.erb"
      end

      package "srvadmin-all" do
        action :install
      end
    end

    if node[:repo][:dellcommunity][:enabled]
      template "/etc/yum.repos.d/dell-community-repository.repo" do
        mode "0644"
        source "dell-community-repository.repo.erb"
      end
    end

    if node[:repo][:dellfirmware][:enabled]
      template "/etc/yum.repos.d/dell-firmware-repository.repo" do
        mode "0644"
        source "dell-firmware-repository.repo.erb"
      end

      package "firmware-tools" do
        action :install
      end
    end
    # yum install $(bootstrap_firmware) at your own risk
  end

end
