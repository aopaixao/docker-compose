FROM ubuntu:20.04
MAINTAINER Alexandre Paixao <alexandre@petamus.com.br>

# Install apache, PHP, and supplimentary programs. openssh-server, curl, and lynx-cur are for debugging the container.
RUN apt-get update && apt-get -y upgrade && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    libapache2-mod-php7.4 apt-transport-https
	
RUN apt-get -y install nano
RUN apt-get -y install zip unzip

RUN apt-get -y install curl php7.4-curl php7.4-zip php7.4-bcmath php7.4-ctype php7.4-fileinfo php7.4-json php7.4-gd

RUN apt-get -y install locales
RUN locale-gen pt_BR.UTF-8
RUN locale-gen en_US.UTF-8	

#Set TimeZone 
#RUN sudo echo "America/Sao_Paulo" > /etc/timezone
#RUN sudo dpkg-reconfigure -f noninteractive tzdata

# Enable apache mods.
RUN a2enmod php7.4
RUN a2enmod rewrite

# Install git 
RUN apt-get -y install git

RUN apt-get -y install php7.4-mysql php7.4-xml php7.4-xmlrpc php7.4-mbstring php7.4-soap php7.4-tokenizer php-pdo

RUN apt-get -y install openssl libcurl4-openssl-dev libssl-dev

# without the following line we get "AH00558: apache2: Could not reliably determine the server's fully qualified domain name"
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Laravel
RUN composer global require "laravel/installer"
RUN echo "export PATH=~/.composer/vendor/bin:$PATH" | tee ~/.bash_profile
#RUN source ~/.bash_profile
RUN . ~/.bash_profile

# Install Node and NPM

RUN curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get install -y nodejs
#RUN apt-get -y install npm
#RUN npm install -g npm && npm install


# Manually set up the apache environment variables
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

# configure vhost
RUN touch /etc/apache2/sites-available/projeto1.conf
ADD config/vhost.conf /etc/apache2/sites-available/projeto1.conf
RUN a2dissite 000-default
RUN a2ensite projeto1


# Expose apache.
EXPOSE 80
#EXPOSE 443

WORKDIR /var/www/html


# start Apache2 on image start
CMD ["/usr/sbin/apache2ctl","-DFOREGROUND"]


