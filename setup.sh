#!/usr/bin/env sh
# -*- coding: utf-8 -*-

sudo sh -c ". $HOME/.dev-openstack/search-openrc.sh && openstack image save --file /opt/qemu/images/windows2012:1.4.qcow2 windows2012:1.4"
