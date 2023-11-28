FROM ubuntu:latest

RUN apt update && apt upgrade -y && apt install wget -y

RUN wget https://update.u.is/downloads/uam/linux/uam-latest_amd64.deb

RUN dpkg -i uam-latest_amd64.deb

ENV UAM_KEY=1313369AB4580A840EC43607B220E2DB21C3C5E222D4B54BEEF3F63971BFDF48

RUN apt install -y vim iputils-ping libglib2.0-0 net-tools curl               
RUN apt install -y build-essential
RUN apt install -y iproute2

EXPOSE 1984 

RUN mkdir ~/.uam

#RUN echo "[net]" >> ~/.uam/uam.ini
#RUN echo "listens=[172.17.0.2]:55111" >> ~/.uam/uam.ini    

#RUN cat ~/.uam/uam.ini 

COPY ./init.sh /init.sh

#CMD /opt/uam/uam --pk $UAM_KEY

ENTRYPOINT /init.sh 
