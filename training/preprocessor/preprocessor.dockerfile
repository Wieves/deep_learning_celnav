# Dockerfile for the image preprocessor.

FROM ubuntu

# ENV vars
ENV http_proxy=http://proxy.ecole-navale.fr:8080
ENV https_proxy=http://proxy.ecole-navale.fr:8080
ENV HTTP_PROXY=http://proxy.ecole-navale.fr:8080
ENV HTTPS_PROXY=http://proxy.ecole-navale.fr:8080

# Prevents questions from hanging the build
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
                apt-get update 
RUN apt-get install -y python3-pip
RUN	apt-get install -y libglib2.0-0
RUN apt-get install -y libsm6 libxext6 libxrender-dev ffmpeg

RUN pip3 install --break-system-packages PyYAML
RUN	pip3 install --break-system-packages numpy
RUN	pip3 install --break-system-packages opencv-python
		
		
ADD preprocessor.py /
ADD preprocessor.yml /

