# Dockerfile for the image generator.

FROM ubuntu

# Prevents questions from hanging the build
ARG DEBIAN_FRONTEND=noninteractive

# ENV vars
ENV http_proxy=http://proxy.ecole-navale.fr:8080
ENV https_proxy=http://proxy.ecole-navale.fr:8080
ENV HTTP_PROXY=http://proxy.ecole-navale.fr:8080
ENV HTTPS_PROXY=http://proxy.ecole-navale.fr:8080

RUN apt-get update 

RUN apt-get install -y xvfb 
RUN apt-get install -y python3-pip 
RUN apt-get install -y stellarium
RUN apt-get install -y automake autotools-dev fuse g++ git libcurl4-openssl-dev libfuse-dev libssl-dev libxml2-dev make pkg-config 
RUN apt-get install -y s3fs 
RUN pip3 install --break-system-packages PyYAML 
RUN pip3 install --break-system-packages numpy
		
		
ADD get_skies.py /
ADD get_skies_helper.py /
ADD screenshot.sh /
ADD default_cfg.ini /

RUN cp default_cfg.ini /usr/share/stellarium/data
RUN chmod +x screenshot.sh

RUN mkdir /data
RUN mkdir /data/image_train_val