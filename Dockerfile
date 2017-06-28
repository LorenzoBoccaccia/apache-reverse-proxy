FROM centos:7
MAINTAINER The CentOS Project <cloud-ops@centos.org>
LABEL Vendor="CentOS" \
      License=GPLv2 \
      Version=2.4.6-40


RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
	rpm -Uvh https://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
	yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install httpd mod_ssl openssl mod_php mod_proxy && \
	yum -y --enablerepo=remi,remi-test,remi-php54,remi-php56 install php-redis  && \ 
	yum clean all


ADD sites.conf /etc/httpd/conf.d/


# Simple startup script to avoid some issues observed with container restart
ADD run-httpd.sh /run-httpd.sh
RUN chmod a+x /run-httpd.sh && \ 
	sed -ri "s@display_errors = Off@display_errors = On@" /etc/php.ini && \
	echo "date.timezone = GMT" >> /etc/php.ini

VOLUME /var/www/html/campaigns/
EXPOSE 80 443
	 

CMD ["/run-httpd.sh"]
