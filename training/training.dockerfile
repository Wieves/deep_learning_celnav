# Dockerfile for model training.

FROM tensorflow/tensorflow:2.15.0-gpu-jupyter

# ENV vars

ENV http_proxy=http://proxy.ecole-navale.fr:8080
ENV https_proxy=http://proxy.ecole-navale.fr:8080
ENV HTTP_PROXY=http://proxy.ecole-navale.fr:8080
ENV HTTPS_PROXY=http://proxy.ecole-navale.fr:8080

ARG DEBIAN_FRONTEND=noninteractive

RUN pip3 install ktrain
RUN pip3 install pandas
RUN pip3 install -q pyyaml h5py

ADD training.py /
ADD training.yml /
