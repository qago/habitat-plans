#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'erb'

plgs = %w(
  extended-choice-parameter@0.76
  workflow-cps@2.29
  git@3.2.0
  scm-api@2.1.1
  workflow-cps-global-lib@2.7
  pipeline-milestone-step@1.3.1
  matrix-project@1.9
  build-timeout@1.18
  workflow-multibranch@2.14
  credentials-binding@1.11
  workflow-aggregator@2.5
  pipeline-model-api@1.1.1
  script-security@1.27
  hidden-parameter@0.0.4 
  structs@1.6 
  authentication-tokens@1.3 
  workflow-step-api@2.9 
  handlebars@1.1.1 
  pipeline-stage-tags-metadata@1.1.1 
  validating-string-parameter@2.3 
  conditional-buildstep@1.3.5 
  workflow-scm-step@2.4 
  icon-shim@2.0.3 
  pipeline-build-step@2.4 
  rebuild@1.25 
  pipeline-model-extensions@1.1.1 
  workflow-basic-steps@2.4 
  branch-api@2.0.8 
  ace-editor@1.1 
  docker-commons@1.6 
  allure-jenkins-plugin@2.22 
  pipeline-stage-view@2.6 
  run-condition@1.0 
  cloudbees-folder@6.0.3 
  workflow-job@2.10 
  built-on-column@1.1 
  junit@1.20 
  git-server@1.7 
  token-macro@2.0 
  pipeline-graph-analysis@1.3 
  git-client@2.4.1 
  javadoc@1.4 
  envinject@1.93.1 
  htmlpublisher@1.12 
  display-url-api@1.1.1 
  plain-credentials@1.4 
  maven-plugin@2.15.1 
  workflow-durable-task-step@2.10 
  multiple-scms@0.6 
  pipeline-rest-api@2.6 
  durable-task@1.13 
  parameterized-trigger@2.33 
  workflow-support@2.14 
  pipeline-stage-step@2.2 
  docker-workflow@1.10 
  pipeline-model-definition@1.1.1 
  pipeline-input-step@2.5 
  workflow-api@2.12 
  graphiteIntegrator@1.2 
  subversion@2.9 
  mapdb-api@1.0.9.0
)

# plgs = %w(
#   extended-choice-parameter@0.76
# )

plgs.each do |plg|
  @name = plg.split('@')[0]
  @version = plg.split('@')[1]
  plg_dir = "jenkins-#{@name}-#{@version}"
  FileUtils.mkdir_p plg_dir
  File.write("#{plg_dir}/plan.sh", ERB.new(File.read('./plan.sh.erb')).result( binding ))
  FileUtils.ln_s "../install_jenkins_plugin.sh", "#{plg_dir}/install_jenkins_plugin.sh", :force => true
  system <<-EOH
    hab pkg build -R #{plg_dir}
    . ./results/last_build.env
    hab pkg upload ./results/$pkg_artifact
    hab pkg promote $pkg_ident stable
  EOH
end
