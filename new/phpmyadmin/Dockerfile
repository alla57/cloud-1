FROM debian:12

RUN DEBIAN_FRONTEND=noninteractive
# Set environment variables for pre-seeding (MySQL in this example)
# ENV PHPMYADMIN_DB_SERVER mysql
# ENV PHPMYADMIN_RECONFIGURE_STRENGTH low
# ENV DB_TYPE mysql
# ENV DB_USER root
# ENV DB_PASS your_mysql_root_password

RUN apt update && apt upgrade -y

RUN apt install -y php php-common php-mbstring php-curl curl wget

WORKDIR /root

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.2.1/phpMyAdmin-5.2.1-all-languages.tar.gz

RUN tar -xzvf phpMyAdmin-5.2.1-all-languages.tar.gz


# RUN apt install -y phpmyadmin

ENTRYPOINT ["/bin/bash"]