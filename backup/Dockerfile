# docker build --target builder -t test .

FROM nvidia/cuda:11.8.0-devel-ubuntu22.04 as builder

RUN apt-get update && \
    apt-get install --no-install-recommends -y git vim build-essential python3-dev python3-venv && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /build

RUN python3 -m venv /build/venv


RUN pip3 wheel --wheel-dir=/app/packages torch torchvision torchaudio

RUN . /build/venv/bin/activate && \
    pip3 install --upgrade pip setuptools && \
    pip3 wheel --wheel-dir=/app/packages torch torchvision torchaudio   && \
    pip3 install /app/packages/*whl