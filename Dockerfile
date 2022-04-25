FROM anibali/pytorch:1.8.1-cuda11.1

ENV DEBIAN_FRONTEND=noninteractive
USER root
SHELL ["/bin/bash", "--login", "-c"]
RUN apt-get update && apt-get install -y --no-install-recommends \
        ffmpeg libsm6 libxext6 p7zip-full unzip wget

WORKDIR /raftstereo
COPY requirements.txt ./requirements.txt
RUN pip install -r requirements.txt

