#!/bin/bash
CONFIG_TARGET=${HOME}/.gitconfig.local

if [ -z ${http_proxy} ] && [ "${http_proxy:-A}" = "${http_proxy-A}" ]; then
    :
else
    echo "create ${CONFIG_TARGET}"
    HTTP=${http_proxy}
    HTTPS=`echo ${HTTP} | sed -e "s/http\(s*\)/http[s]/"`
    cat << EOT >> ${CONFIG_TARGET}
[http]
	proxy = ${HTTP}
[https]
	proxy = ${HTTPS}
[url "https://"]
	insteadOf = git://
EOT
fi
