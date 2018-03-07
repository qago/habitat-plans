#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'fileutils'
require 'erb'

def build(plg)
  @name = plg.split('/')[1]
  @name.slice! 'jenkins-'
  @version = plg.split('/')[2]
  plg_dir = "plugins/jenkins-#{@name}-#{@version}"
  FileUtils.mkdir_p plg_dir
  File.write("#{plg_dir}/plan.sh", ERB.new(File.read('./plugin_plan.sh.erb')).result( binding ))
  system <<-EOH
    cd plugins
    hab pkg build -R #{plg_dir}
    . ./results/last_build.env
    sudo hab pkg install ./results/$pkg_artifact
  EOH
end

build ARGV[0]
