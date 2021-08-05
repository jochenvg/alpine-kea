#!/bin/bash

set -e

case $1 in
	init)
		kea-admin db-init mysql -h $KEA_ADMIN_DB_HOST -i $KEA_ADMIN_DB_USER -n $KEA_ADMIN_DB_NAME || \
		kea-admin db-upgrade mysql -h $KEA_ADMIN_DB_HOST -i $KEA_ADMIN_DB_USER -n $KEA_ADMIN_DB_NAME
		;;
	*)
		exec "$@"
		;;
esac

