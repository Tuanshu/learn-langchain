import os

# orginal
# class Config:
#     def __init__(self) -> None:
#         self.base_model_size = "13b" if os.getenv("USE_13B_MODEL") else "7b"
#         self.use_4bit = True if os.getenv("USE_4BIT") else False
#         self.use_fine_tuned_lora = True if os.getenv("USE_FINE_TUNED_LORA") else False
#         self.lora_weights = os.getenv("LORA_WEIGHTS")
#         self.device = "cpu" if os.getenv("USE_CPU") else "cuda"
#         self.model_path = os.getenv("MODEL_PATH")
#         self.model_checkpoint = os.getenv("MODEL_CHECKPOINT")

#     def __str__(self) -> str:
#         return str(self.__dict__)


# ts hardcoded
class Config:
    def __init__(self) -> None:
        self.base_model_size = "13b"
        self.use_4bit = True
        self.use_fine_tuned_lora = False
        # self.lora_weights = os.getenv("LORA_WEIGHTS")
        self.device = "cpu"
        self.model_path = "D:/lanquege_models/vicuna-13B-1.1-GPTQ-4bit-128g"
        self.model_checkpoint = "vicuna-13B-1.1-GPTQ-4bit-128g.safetensors"

    def __str__(self) -> str:
        return str(self.__dict__)
