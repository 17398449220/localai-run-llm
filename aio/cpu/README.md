## AIO CPU size

Use this image with CPU-only.

Please keep using only C++ backends so the base image is as small as possible (without CUDA, cuDNN, python, etc).

## 使用docker 启动本地镜像

```bash
# 开启日志：
docker run -p 8080:8080 -e DEBUG=true --name local-ai -it \
-v `pwd`/aio:/aio -v `pwd`/models:/build/models localai/localai:latest-aio-cpu

```

测试接口

```bash

curl -X 'POST' http://0.0.0.0:8080/v1/embeddings \
 -H "Content-Type: application/json" \
 -d '{
  "input": "测试ebmeddings",
  "model": "text-embedding-ada-002"
}'


curl -X 'POST' 'http://0.0.0.0:8080/v1/chat/completions' \
-H 'Content-Type: application/json' -d '{
    "model": "qwen-1.5-0.5b-chat",
    "messages": [
        {
            "role": "user",
            "content": "北京景点?"
        }
    ],
    "temperature": 1
}'


## 生成图片 Model name: stablediffusion                                                 

curl http://localhost:8080/v1/images/generations -H "Content-Type: application/json" -d '{
  "prompt": "floating hair, portrait, ((loli)), ((one girl)), cute face, hidden hands, asymmetrical bangs, beautiful detailed eyes, eye shadow, hair ornament, ribbons, bowties, buttons, pleated skirt, (((masterpiece))), ((best quality)), colorful|((part of the head)), ((((mutated hands and fingers)))), deformed, blurry, bad anatomy, disfigured, poorly drawn face, mutation, mutated, extra limb, ugly, poorly drawn hands, missing limb, blurry, floating limbs, disconnected limbs, malformed hands, blur, out of focus, long neck, long body, Octane renderer, lowres, bad anatomy, bad hands, text",
  "size": "256x256"
}'


curl http://localhost:8080/v1/audio/transcriptions -H "Content-Type: multipart/form-data" -F file="@$PWD/voice-test.mp3" -F model="whisper-1"


curl http://localhost:8080/tts -H "Content-Type: application/json" -d '{
    "model":"voice-en-us-amy-low",
    "input": "Hi, this is a test."
}'

```