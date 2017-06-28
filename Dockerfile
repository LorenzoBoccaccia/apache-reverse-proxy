FROM centos:7

LABEL Vendor="CentOS" \
      License=GPLv2 \
      Version=2.4.6-40


RUN     yum -y --setopt=tsflags=nodocs update && \
    	yum -y --setopt=tsflags=nodocs install httpd mod_ssl openssl mod_proxy && \
	yum clean all


ADD sites.conf /etc/httpd/conf.d/


# Simple startup script to avoid some issues observed with container restart
ADD run-httpd.sh /run-httpd.sh
RUN chmod a+x /run-httpd.sh 

VOLUME /var/www/html/campaigns/
EXPOSE 80 443
	 

CMD ["/run-httpd.sh"]
