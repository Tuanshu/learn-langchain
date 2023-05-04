PS D:\repos\learn-langchain> docker compose up --build
[+] Building 44.2s (21/21) FINISHED
 => [internal] load .dockerignore                                                                                                                    0.0s
 => => transferring context: 147B                                                                                                                    0.0s 
 => [internal] load build definition from Dockerfile                                                                                                 0.0s 
 => => transferring dockerfile: 1.54kB                                                                                                               0.0s 
 => [internal] load metadata for docker.io/nvidia/cuda:11.8.0-runtime-ubuntu22.04                                                                    2.2s
 => [auth] nvidia/cuda:pull token for registry-1.docker.io                                                                                           0.0s
 => [internal] load build context                                                                                                                    0.0s
 => => transferring context: 14.22kB                                                                                                                 0.0s 
 => [stage-0  1/15] FROM docker.io/nvidia/cuda:11.8.0-runtime-ubuntu22.04@sha256:9b9ce0e128463d147a58b5013255c60e7eb725141f37c197b1ddee5aeb7e4161    0.0s 
 => CACHED [stage-0  2/15] RUN apt-get update &&     apt-get install --no-install-recommends -y git vim build-essential python3-dev python3-venv py  0.0s
 => CACHED [stage-0  3/15] RUN --mount=type=cache,target=/root/.cache/pip pip3 install virtualenv                                                    0.0s 
 => CACHED [stage-0  4/15] RUN mkdir /app                                                                                                            0.0s 
 => CACHED [stage-0  5/15] WORKDIR /app                                                                                                              0.0s 
 => CACHED [stage-0  6/15] RUN test -n "HEAD" && git reset --hard HEAD || echo "Using provided webui source"                                         0.0s 
 => CACHED [stage-0  7/15] COPY ts_packages/ /app/packages/                                                                                          0.0s 
 => CACHED [stage-0  8/15] RUN virtualenv /app/venv                                                                                                  0.0s 
 => CACHED [stage-0  9/15] RUN . /app/venv/bin/activate &&     pip3 install --upgrade pip setuptools &&     pip3 install /app/packages/*whl &&       0.0s 
 => CACHED [stage-0 10/15] COPY requirements.txt /app/requirements.txt                                                                               0.0s 
 => CACHED [stage-0 11/15] RUN . /app/venv/bin/activate &&     pip3 install -r requirements.txt                                                      0.0s 
 => CACHED [stage-0 12/15] COPY requirements_gptq.txt /app/requirements_gptq.txt                                                                     0.0s 
 => CACHED [stage-0 13/15] RUN . /app/venv/bin/activate &&     pip3 install -r requirements_gptq.txt                                                 0.0s 
 => [stage-0 14/15] COPY . /app/                                                                                                                    33.2s 
 => [stage-0 15/15] RUN rm -rf /app/ts_packages/*whl                                                                                                 0.6s 
 => exporting to image                                                                                                                               8.1s 
 => => exporting layers                                                                                                                              8.1s 
 => => writing image sha256:3c5c91262d24a322340333cee1eed7ef73b7cc47ee2cb9f51f3e18143762108e                                                         0.0s 
 => => naming to docker.io/library/my_langchain_cuda_env:latest                                                                                      0.0s 
[+] Running 1/1
 ✔ Container learn-langchain-my_langchain_cuda_env-1  Recreated                                                                                      0.4s 
Attaching to learn-langchain-my_langchain_cuda_env-1
learn-langchain-my_langchain_cuda_env-1  | 
learn-langchain-my_langchain_cuda_env-1  | ==========
learn-langchain-my_langchain_cuda_env-1  | == CUDA ==
learn-langchain-my_langchain_cuda_env-1  | ==========
learn-langchain-my_langchain_cuda_env-1  | 
learn-langchain-my_langchain_cuda_env-1  | CUDA Version 11.8.0
learn-langchain-my_langchain_cuda_env-1  |
learn-langchain-my_langchain_cuda_env-1  | Container image Copyright (c) 2016-2022, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
learn-langchain-my_langchain_cuda_env-1  |
learn-langchain-my_langchain_cuda_env-1  | This container image and its contents are governed by the NVIDIA Deep Learning Container License.
learn-langchain-my_langchain_cuda_env-1  | By pulling and using the container, you accept the terms and conditions of this license:
learn-langchain-my_langchain_cuda_env-1  | https://developer.nvidia.com/ngc/nvidia-deep-learning-container-license
learn-langchain-my_langchain_cuda_env-1  |
learn-langchain-my_langchain_cuda_env-1  | A copy of this license is made available in this container at /NGC-DL-CONTAINER-LICENSE for your convenience.  
learn-langchain-my_langchain_cuda_env-1  | 
learn-langchain-my_langchain_cuda_env-1  | Using config:  {'base_model_size': '13b', 'use_4bit': True, 'use_fine_tuned_lora': False, 'device': 'cpu', 'model_path': '/app/models/vicuna-13B-1.1-GPTQ-4bit-128g', 'model_checkpoint': 'vicuna-13B-1.1-GPTQ-4bit-128g.safetensors'}
learn-langchain-my_langchain_cuda_env-1  | ts: model_path /app/models/vicuna-13B-1.1-GPTQ-4bit-128g
learn-langchain-my_langchain_cuda_env-1  | ts: os.path.exists(model_path) True
learn-langchain-my_langchain_cuda_env-1  | ts: model_checkpoint vicuna-13B-1.1-GPTQ-4bit-128g.safetensors
learn-langchain-my_langchain_cuda_env-1  | Loading model /app/models/vicuna-13B-1.1-GPTQ-4bit-128g  checkpoint /app/models/vicuna-13B-1.1-GPTQ-4bit-128g/vicuna-13B-1.1-GPTQ-4bit-128g.safetensors
learn-langchain-my_langchain_cuda_env-1  | Loading model ...
learn-langchain-my_langchain_cuda_env-1  | /app/venv/lib/python3.10/site-packages/safetensors/torch.py:99: UserWarning: TypedStorage is deprecated. It will be removed in the future and UntypedStorage will be the only storage class. This should only matter to you if you are using storages directly.  To access UntypedStorage directly, use tensor.untyped_storage() instead of tensor.storage()
learn-langchain-my_langchain_cuda_env-1  |   with safe_open(filename, framework="pt", device=device) as f:
learn-langchain-my_langchain_cuda_env-1  | /app/venv/lib/python3.10/site-packages/torch/_utils.py:776: UserWarning: TypedStorage is deprecated. It will be removed in the future and UntypedStorage will be the only storage class. This should only matter to you if you are using storages directly.  To access UntypedStorage directly, use tensor.untyped_storage() instead of tensor.storage()
learn-langchain-my_langchain_cuda_env-1  |   return self.fget.__get__(instance, owner)()
learn-langchain-my_langchain_cuda_env-1  | /app/venv/lib/python3.10/site-packages/torch/storage.py:899: UserWarning: TypedStorage is deprecated. It will be removed in the future and UntypedStorage will be the only storage class. This should only matter to you if you are using storages directly.  To access UntypedStorage directly, use tensor.untyped_storage() instead of tensor.storage()
learn-langchain-my_langchain_cuda_env-1  |   storage = cls(wrap_storage=untyped_storage)
learn-langchain-my_langchain_cuda_env-1  | Found 3 unique KN Linear values.
learn-langchain-my_langchain_cuda_env-1  | Warming up autotune cache ...
100% 12/12 [04:43<00:00, 23.60s/it]nv-1  | 
learn-langchain-my_langchain_cuda_env-1  | Found 1 unique fused mlp KN values.
learn-langchain-my_langchain_cuda_env-1  | Warming up autotune cache ...
  0% 0/12 [00:00<?, ?it/s]python: /project/lib/Analysis/Allocation.cpp:42: std::pair<llvm::SmallVector<unsigned int>, llvm::SmallVector<unsigned int> > mlir::triton::getCvtOrder(const mlir::Attribute&, const mlir::Attribute&): Assertion `!(srcMmaLayout && dstMmaLayout) && "Unexpected mma -> mma layout conversion"' failed.
learn-langchain-my_langchain_cuda_env-1  | Aborted
learn-langchain-my_langchain_cuda_env-1 exited with code 134