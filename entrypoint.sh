#!/bin/bash

case $1 in
	init)
		kea-admin db-init mysql -h $KEA_ADMIN_DB_HOST -u $KEA_ADMIN_DB_USER -n $KEA_ADMIN_DB_NAME || \
		kea-admin db-upgrade mysql -h $KEA_ADMIN_DB_HOST -u $KEA_ADMIN_DB_USER -n $KEA_ADMIN_DB_NAME
		;;
	dhcp4)
		exec kea-dhcp4 -d -c /etc/kea/kea-dhcp4.conf
		;;
	*)
		exec "$@"
		;;
esac

