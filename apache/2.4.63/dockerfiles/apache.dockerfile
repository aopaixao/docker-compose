FROM httpd:2.4.63

#Set apache path
ENV HTTPD_PATH /usr/local/apache2

# Enable apache mods.
RUN echo "LoadModule rewrite_module modules/mod_rewrite.so" >> "$HTTPD_PATH"/conf/httpd.conf

# without the following line we get "AH00558: apache2: Could not reliably determine the server's fully qualified domain name"
RUN echo "ServerName localhost" >> "$HTTPD_PATH"/conf/httpd.conf

#Set custom http-conf
RUN sed -i -E 's:^#(Include conf/extra/httpd-default.conf):\1:' "$HTTPD_PATH"/conf/httpd.conf

#Create log dir
#RUN mkdir -p /var/www/html/log

# Manually set up the apache environment variables
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
#ENV APACHE_LOG_DIR /var/www/html/log
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

# configure vhost
COPY dockerfiles/config/vhost.conf "$HTTPD_PATH"/conf/extra/httpd-default.conf


# Expose apache.
EXPOSE 80

WORKDIR /var/www/html


# start Apache2 on image start
#CMD ["/usr/sbin/apache2ctl","-DFOREGROUND"]
