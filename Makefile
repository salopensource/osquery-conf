USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make
PACKAGE_VERSION=0.0.1
TITLE=sal-osquery-conf
PACKAGE_NAME=${TITLE}
REVERSE_DOMAIN=com.github.salopensource
PAYLOAD=\
	pack-logging \
	pack-osquery \
	pack-Library-LaunchDaemons-com.facebook.osqueryd.plist

pack-logging:
	@sudo mkdir -p ${WORK_D}/private/var/log/osquery/
	@sudo mkdir -p ${WORK_D}/private/etc/newsyslog.d/
	@sudo ${INSTALL} -m 644 -g wheel -o root "com.facebook.osqueryd.conf" ${WORK_D}/private/etc/newsyslog.d

pack-osquery:
	@sudo mkdir -p ${WORK_D}/private/var/osquery/osquery.conf.d
	@sudo ${INSTALL} -m 644 -g wheel -o root "osquery.conf" ${WORK_D}/private/var/osquery
	@sudo ${INSTALL} -m 644 -g wheel -o root "sal.conf" ${WORK_D}/private/var/osquery/osquery.conf.d
