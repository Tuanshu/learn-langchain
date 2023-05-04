
FROM nvidia/cuda:11.8.0-devel-ubuntu22.04 as builder

RUN apt-get update && \
    apt-get install --no-install-recommends -y git vim build-essential python3-dev python3-venv && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /build
WORKDIR /build
RUN python3 -m venv /build/venv

# ts: add to install manually downloaded packages
COPY ts_packages/ /app/packages/
#RUN . /build/venv/bin/activate && pip3 install /app/packages/*


# ts: follwoing is original lines (but i added --default-timeout=1200)
RUN . /build/venv/bin/activate && \
    pip3 install --upgrade pip setuptools && \
    #pip3 install --find-links=/app/packages/ torch torchvision torchaudio && \
    #pip3 install -r requirements.txt
    pip3 install /app/packages/*whl && \
    rm -rf /app/packages/*whl


# https://developer.nvidia.com/cuda-gpus
# for a rtx 2060: ARG TORCH_CUDA_ARCH_LIST="7.5"
ARG TORCH_CUDA_ARCH_LIST="3.5;5.0;6.0;6.1;7.0;7.5;8.0;8.6+PTX"


FROM nvidia/cuda:11.8.0-runtime-ubuntu22.04

LABEL maintainer="tuanshu <tuanshu@gmail.com>"
LABEL description="helloworld to langchain docker env"

RUN apt-get update && \
    apt-get install --no-install-recommends -y git python3 python3-pip make g++ && \
    rm -rf /var/lib/apt/lists/*

RUN --mount=type=cache,target=/root/.cache/pip pip3 install virtualenv
RUN mkdir /app

WORKDIR /app

# maybe no need
ARG WEBUI_VERSION
RUN test -n "${WEBUI_VERSION}" && git reset --hard ${WEBUI_VERSION} || echo "Using provided webui source"

COPY ts_packages/ /app/packages/

RUN virtualenv /app/venv
RUN . /app/venv/bin/activate && \
    pip3 install --upgrade pip setuptools && \
    pip3 install /app/packages/*whl && \
    rm -rf /app/packages/*whl

COPY requirements.txt /app/requirements.txt
RUN . /app/venv/bin/activate && \
    pip3 install -r requirements.txt

COPY requirements_gptq.txt /app/requirements_gptq.txt
RUN . /app/venv/bin/activate && \
    pip3 install -r requirements_gptq.txt

# wierd to me
#RUN cp /app/venv/lib/python3.10/site-packages/bitsandbytes/libbitsandbytes_cuda118.so /app/venv/lib/python3.10/site-packages/bitsandbytes/libbitsandbytes_cpu.so

COPY . /app/
RUN rm -rf /app/ts_packages/*whl
#ENV CLI_ARGS=""
#CMD . /app/venv/bin/activate && python3 server.py ${CLI_ARGS}
CMD . /app/venv/bin/activate && uvicorn servers.vicuna_server:app
