FROM ubuntu:24.04
RUN apt update && apt install -y curl git sudo wget vim


RUN groupadd devs
RUN useradd -g devs -d /home/test_user -m test_user 

COPY  ../command.sh ./command.sh
RUN chmod +x command.sh
RUN ./command.sh
