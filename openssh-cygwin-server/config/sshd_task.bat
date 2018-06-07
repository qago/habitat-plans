@echo off
{{pkgPathFor "core/hab"}}\bin\hab.exe pkg exec qago/openssh-cygwin-server sshd -D -f {{pkg.svc_config_path}}/sshd_config
