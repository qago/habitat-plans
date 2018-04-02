pkg_name=jenkins-service
pkg_origin=qago
pkg_version='1.0.21'
pkg_description="Jenkins service"
pkg_maintainer='QAGO Maintainers'
pkg_license=('LGPL-2.1')
pkg_upstream_url=""
pkg_source=_no_pkg_source_
pkg_shasum=_no_pkg_shasum_

# Groovy code to generate plugin list with versions:
# for example http://ci.qa.go.devmail.ru/script
#
# Jenkins.instance.pluginManager.plugins.each{ plugin -> println("    qago/jenkins-${plugin.getShortName()}/${plugin.getVersion()}") }
jenkins_plugins=(
    # qago/jenkins-structs/1.14
    # qago/jenkins-script-security/1.41
    # qago/jenkins-command-launcher/1.2
    # qago/jenkins-job-dsl/1.68
    # qago/jenkins-windows-slaves/1.0
    # qago/jenkins-junit/1.20
    # qago/jenkins-docker-commons/1.6
    # qago/jenkins-display-url-api/1.1.1
    # qago/jenkins-matrix-project/1.9
    # qago/jenkins-envinject/1.93.1
    # qago/jenkins-pipeline-model-extensions/1.1.1
    # qago/jenkins-handlebars/1.1.1
    # qago/jenkins-built-on-column/1.1
    # qago/jenkins-pipeline-rest-api/2.6
    # qago/jenkins-filesystem_scm/1.20
    # qago/jenkins-pipeline-graph-analysis/1.3
    # qago/jenkins-git-server/1.7
    # qago/jenkins-authentication-tokens/1.3
    # qago/jenkins-workflow-multibranch/2.14
    # qago/jenkins-ace-editor/1.1
    # qago/jenkins-multiple-scms/0.6
    # qago/jenkins-workflow-aggregator/2.5
    # qago/jenkins-pipeline-input-step/2.5
    # qago/jenkins-pipeline-stage-step/2.2
    # qago/jenkins-javadoc/1.4
    # qago/jenkins-validating-string-parameter/2.3
    # qago/jenkins-build-timeout/1.18
    # qago/jenkins-pipeline-model-definition/1.1.1
    # qago/jenkins-branch-api/2.0.8
    # qago/jenkins-workflow-cps/2.29
    # qago/jenkins-git-client/2.4.1
    # qago/jenkins-workflow-api/2.12
    # qago/jenkins-pipeline-stage-view/2.6
    # qago/jenkins-antisamy-markup-formatter/1.1
    # qago/jenkins-conditional-buildstep/1.3.5
    # qago/jenkins-token-macro/2.0
    # qago/jenkins-credentials-binding/1.11
    # qago/jenkins-pipeline-milestone-step/1.3.1
    # qago/jenkins-plain-credentials/1.4
    # qago/jenkins-graphiteIntegrator/1.2
    # qago/jenkins-pam-auth/1.1
    # qago/jenkins-ssh-credentials/1.13
    # qago/jenkins-pipeline-build-step/2.4
    # qago/jenkins-htmlpublisher/1.12
    # qago/jenkins-credentials/2.1.13
    # qago/jenkins-workflow-cps-global-lib/2.7
    # qago/jenkins-matrix-auth/1.1
    # qago/jenkins-subversion/2.9
    # qago/jenkins-docker-workflow/1.10
    # qago/jenkins-cvs/2.11
    # qago/jenkins-parameterized-trigger/2.33
    # qago/jenkins-workflow-durable-task-step/2.10
    # qago/jenkins-workflow-scm-step/2.4
    # qago/jenkins-rebuild/1.25
    # qago/jenkins-durable-task/1.13
    # qago/jenkins-jenkins-multijob-plugin/1.24
    # qago/jenkins-bouncycastle-api/2.16.0
    # qago/jenkins-run-condition/1.0
    # qago/jenkins-maven-plugin/2.15.1
    # qago/jenkins-allure-jenkins-plugin/2.22
    # qago/jenkins-cloudbees-folder/6.0.3
    # qago/jenkins-pipeline-stage-tags-metadata/1.1.1
    # qago/jenkins-ant/1.2
    # qago/jenkins-workflow-basic-steps/2.4
    # qago/jenkins-ssh-slaves/1.9
    # qago/jenkins-workflow-step-api/2.9
    # qago/jenkins-workflow-job/2.10
    # qago/jenkins-translation/1.10
    # qago/jenkins-mapdb-api/1.0.9.0
    # qago/jenkins-hidden-parameter/0.0.4
    # qago/jenkins-git/3.2.0
    # qago/jenkins-scm-api/2.1.1
    # qago/jenkins-email-ext/2.57.1
    # qago/jenkins-momentjs/1.1.1
    # qago/jenkins-external-monitor-job/1.4
    # qago/jenkins-pipeline-model-api/1.1.1
    # qago/jenkins-ldap/1.11
    # qago/jenkins-jquery/1.11.2-0
    # qago/jenkins-icon-shim/2.0.3
    # qago/jenkins-mailer/1.20
    # qago/jenkins-extended-choice-parameter/0.76
    # qago/jenkins-jquery-detached/1.2.1
    # qago/jenkins-ruby-runtime/0.12
    # qago/jenkins-workflow-support/2.14
)

pkg_deps=(
    core/jenkins/2.89.4/20180221042204
    core/wget/1.19.1/20171024102323
    core/netcat/0.7.1/20170514150813
    core/bash/4.3.42/20170513213519
    core/grep/2.22/20170513213444
    core/sed/4.2.2/20170513213123
    core/unzip/6.0/20170513215357
    core/coreutils/8.25/20170513213226
)
pkg_deps=("${pkg_deps[@]}" "${jenkins_plugins[@]}")

pkg_exports=(
  [port]=jenkins-service.port
)
pkg_exposes=(port)
pkg_svc_user="hab"

do_download() {
    return 0
}

do_unpack() {
    return 0
}

do_verify() {
    return 0
}

do_prepare() {
    return 0
}

_install_dependency() {
    local dep="${1}"
    if [[ -z "${NO_INSTALL_DEPS:-}" ]]; then
	$HAB_BIN pkg path "$dep" || $HAB_BIN install -u $HAB_BLDR_URL --channel $HAB_BLDR_CHANNEL "$dep" || {
		if [[ "$HAB_BLDR_CHANNEL" != "$FALLBACK_CHANNEL" ]]; then
		    build_line "Trying to install '$dep' from '$FALLBACK_CHANNEL'"
		    $HAB_BIN install -u $HAB_BLDR_URL --channel "$FALLBACK_CHANNEL" "$dep" || true
		fi
	    }
    fi
    return 0
}

do_install() {
    mkdir -p $pkg_prefix/plugins
    for plg in "${jenkins_plugins[@]}"
    do
	for hpi in $(hab pkg path $plg)/plugins/*.hpi; do
	    ln -sf $hpi $pkg_prefix/plugins/
	done	
    done
}


do_build() {
    return 0
}
