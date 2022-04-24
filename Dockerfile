FROM anibali/pytorch:1.8.1-cuda11.1

WORKDIR /RAFTStereo
COPY environment.yaml ./environment.yaml
RUN conda env create -f environment.yaml && conda init bash
RUN echo "conda activate myenv" >> ~/.bashrc
SHELL ["/bin/bash", "--login", "-c"]

COPY entrypoint.sh ./entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]

