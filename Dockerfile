# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
RUN comfy node install --exit-on-fail comfyui-ollama@2.1.0 --mode remote
RUN comfy node install --exit-on-fail ComfyUI-GGUF@1.1.9
RUN comfy node install --exit-on-fail comfyui-florence2@1.0.7
RUN comfy node install --exit-on-fail seedvr2_videoupscaler@2.5.24
RUN comfy node install --exit-on-fail rgthree-comfy@1.0.2512112053
RUN comfy node install --exit-on-fail comfyui-easy-use@1.3.5
RUN comfy node install --exit-on-fail ComfyLiterals
RUN comfy node install --exit-on-fail comfyui_lg_tools@1.3.7
RUN comfy node install --exit-on-fail was-ns@3.0.1
RUN comfy node install --exit-on-fail comfyui_custom_nodes_alekpet@1.0.89
# Note: The "unknown_registry" group contains custom nodes that could not be resolved automatically (no aux_id provided): Reroute, Fast Groups Bypasser (rgthree), MarkdownNote

# download models into comfyui
RUN comfy model download --url https://huggingface.co/Comfy-Org/z_image_turbo/blob/main/split_files/text_encoders/qwen_3_4b.safetensors --relative-path models/text_encoders --filename qwen_3_4b.safetensors
# RUN # Could not find URL for Qwen3-4B-Q8_0.gguf
# RUN # Could not find URL for z_image_turbo_bf16.safetensors
# RUN # Could not find URL for z_image_turbo-Q8_0.gguf
# RUN # Could not find URL for ema_vae_fp16.safetensors
# RUN # Could not find URL for seedvr2_ema_3b-Q8_0.gguf
# RUN # Could not find URL for ZIT_Lora_AFrame21.safetensors
# RUN # Could not find URL for ae.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
