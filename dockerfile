FROM ubuntu
EXPOSE 80 
RUN apt-get update
RUN apt-get install apache2 -y 
RUN apt-get clean
WORKDIR var/www/html/
CMD ["apache2", "-D", "foreground"]