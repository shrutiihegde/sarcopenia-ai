FROM tensorflow/tensorflow:1.14.0-gpu-py3

# Quick fix for E: The repository 'https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  InRelease' is no longer signed.
RUN rm /etc/apt/sources.list.d/cuda.list && rm /etc/apt/sources.list.d/nvidia-ml.list

RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -y \
    libsm6 \
    libxext6 \
    libxrender-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

ADD ./requirements.txt /
RUN pip install -r /requirements.txt

ADD . /sarcopenia_ai

RUN pip3 install -e /sarcopenia_ai

WORKDIR /sarcopenia_ai
