FROM continuumio/miniconda3

WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        gcc \
        g++ \
        make \
        wget \
        curl \
        git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN conda create -n gsMap python=3.10 -y && \
    echo "conda activate gsMap" >> ~/.bashrc

RUN /bin/bash -c "source ~/.bashrc && conda activate gsMap && \
    pip install gsMap && \
    pip install 'zarr==2.14.2' 'numcodecs==0.11.0'"

SHELL ["/bin/bash", "-c"]

CMD ["bash", "-c", "source ~/.bashrc && conda activate gsMap && exec bash"]
