FROM ubuntu/apache2:2.4-22.04_beta

# Install plugins
RUN a2enmod rewrite
RUN a2enmod headers
RUN service apache2 restart

COPY apache2.conf /etc/apache2/apache2.conf
