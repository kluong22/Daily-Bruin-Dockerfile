FROM ubuntu:12.04

RUN apt-get update
RUN apt-get install -y nginx zip curl

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN curl -o /usr/share/nginx/www/master.zip -L https://github.com/kluong22/sounds-of-schoenberg/archive/master.zip
RUN cd /usr/share/nginx/www/ && unzip master.zip && mv sounds-of-schoenberg-master/* . && rm -rf sounds-of-schoenberg-master master.zip

EXPOSE 80

CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]