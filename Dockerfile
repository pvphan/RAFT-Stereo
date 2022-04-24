FROM anibali/pytorch:1.8.1-cuda11.1

WORKDIR /RAFTStereo
COPY requirements.txt ./requirements.txt
RUN pip install -r requirements.txt

SHELL ["/bin/bash", "--login", "-c"]

