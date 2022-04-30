FROM anibali/pytorch:1.8.1-cuda11.1

ENV DEBIAN_FRONTEND=noninteractive
USER root
SHELL ["/bin/bash", "-c"]

#RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin \
#    && mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600 \
#    && wget https://developer.download.nvidia.com/compute/cuda/11.6.2/local_installers/cuda-repo-ubuntu2004-11-6-local_11.6.2-510.47.03-1_amd64.deb \
#    && dpkg -i cuda-repo-ubuntu2004-11-6-local_11.6.2-510.47.03-1_amd64.deb \
#    && apt-key add /var/cuda-repo-ubuntu2004-11-6-local/7fa2af80.pub \
#    && apt-get update \
#    && apt-get -y install cuda

# Update nvidia GPG key
WORKDIR /tmp
# apt-key del 7fa2af80
# wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-keyring_1.0-1_all.deb
# dpkg -i cuda-keyring_1.0-1_all.deb
RUN rm /etc/apt/sources.list.d/cuda.list \
    && rm /etc/apt/sources.list.d/nvidia-ml.list \
    && apt-key del 7fa2af80 \
    && apt-get update

RUN apt-get install -y --no-install-recommends wget \
    && wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-keyring_1.0-1_all.deb \
    && dpkg -i cuda-keyring_1.0-1_all.deb \
    && apt-get update

RUN apt-get update && apt-get install -y --no-install-recommends \
        ffmpeg libsm6 libxext6 p7zip-full unzip

WORKDIR /raftstereo
COPY requirements.txt ./requirements.txt
RUN pip install -r requirements.txt
