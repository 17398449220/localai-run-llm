## 1，localai 项目

下载二进制文件：
https://github.com/mudler/LocalAI/releases

```bash
cuda11
wget https://github.com/mudler/LocalAI/releases/download/v2.12.3/local-ai-cuda11-Linux-x86_64

cpu
https://github.com/mudler/LocalAI/releases/download/v2.12.3/local-ai-avx2-Linux-x86_64
```

替换地址：https://huggingface.co 成：https://hf-mirror.com/

模型启动方法：
https://localai.io/models/

## 1，创建embedding 接口

```bash
curl http://localhost:8080/models/apply -H "Content-Type: application/json" -d '{
   "url": "https://gitee.com/fly-llm/localai-run-llm/raw/master/model-gallery/bert-embeddings.yaml",
   "name": "text-embedding-ada-002"
 }'
```

测试：

```bash
curl -X 'POST' http://0.0.0.0:8080/v1/embeddings \
 -H "Content-Type: application/json" \
 -d '{
  "input": "测试ebmeddings",
  "model": "text-embedding-ada-002"
}'
```

## 3，大模型 qwen1.5-0.5b-chat，速度快

参考地址：
https://github.com/mudler/LocalAI/issues/1110


```bash
curl http://localhost:8080/models/apply -H "Content-Type: application/json" -d '{
   "url": "https://gitee.com/fly-llm/localai-run-llm/raw/master/model-gallery/qwen1.5-0.5b.yaml",
   "name": "qwen1.5-0.5b-chat"
 }'
```

测试接口

```bash
curl -X 'POST' 'http://0.0.0.0:8080/v1/chat/completions' \
-H 'Content-Type: application/json' -d '{
    "model": "qwen1.5-0.5b-chat",
    "messages": [
        {
            "role": "user",
            "content": "北京景点?"
        }
    ],
    "max_tokens": 512,
    "temperature": 0.7
}'
```

## 大模型 qwen1.5-1.8b-chat，速度快

参考地址：
https://github.com/mudler/LocalAI/issues/1110


```bash
curl http://localhost:8080/models/apply -H "Content-Type: application/json" -d '{
   "url": "https://gitee.com/fly-llm/localai-run-llm/raw/master/model-gallery/qwen1.5-1.8b.yaml",
   "name": "qwen1.5-1.8b-chat"
 }'
```

测试接口

```bash
curl -X 'POST' 'http://0.0.0.0:8080/v1/chat/completions' \
-H 'Content-Type: application/json' -d '{
    "model": "qwen1.5-1.8b-chat","stream":true,
    "messages": [
        {
            "role": "user",
            "content": "北京景点"
        }
    ]
}'
```


## 大模型 qwen1.5-7b-chat，速度快

参考地址：
https://github.com/mudler/LocalAI/issues/1110


```bash
curl http://localhost:8080/models/apply -H "Content-Type: application/json" -d '{
   "url": "https://gitee.com/fly-llm/localai-run-llm/raw/master/model-gallery/qwen1.5-7b.yaml",
   "name": "qwen1.5-7b-chat"
 }'
```

测试接口

```bash
curl -X 'POST' 'http://0.0.0.0:8080/v1/chat/completions' \
-H 'Content-Type: application/json' -d '{
    "model": "qwen1.5-7b-chat","stream":true,
    "messages": [
        {
            "role": "user",
            "content": "北京景点"
        }
    ]
}'
```

## 大模型 qwen1.5-14b-chat，速度快

参考地址：
https://github.com/mudler/LocalAI/issues/1110


```bash

axel -a  "https://www.modelscope.cn/api/v1/models/qwen/Qwen1.5-14B-Chat-GGUF/repo?Revision=master&FilePath=qwen1_5-14b-chat-q4_0.gguf"


curl http://localhost:8080/models/apply -H "Content-Type: application/json" -d '{
   "url": "https://gitee.com/fly-llm/localai-run-llm/raw/master/model-gallery/qwen1.5-14b.yaml",
   "name": "qwen1.5-14b-chat"
 }'
```

测试接口

```bash
curl -X 'POST' 'http://0.0.0.0:8080/v1/chat/completions' \
-H 'Content-Type: application/json' -d '{
    "model": "qwen1.5-14b-chat","stream":true,
    "messages": [
        {
            "role": "user",
            "content": "北京景点"
        }
    ]
}'
```


## 大模型 qwen1.5-32b-chat，速度快
 

```bash

wget "https://modelscope.cn/api/v1/models/qwen/Qwen1.5-32B-Chat-GGUF/repo?Revision=master&FilePath=qwen1_5-32b-chat-q4_0.gguf"


curl http://localhost:8080/models/apply -H "Content-Type: application/json" -d '{
   "url": "https://gitee.com/fly-llm/localai-run-llm/raw/master/model-gallery/qwen1.5-32b.yaml",
   "name": "qwen1.5-32b-chat"
 }'
```

测试接口

```bash
curl -X 'POST' 'http://0.0.0.0:8080/v1/chat/completions' \
-H 'Content-Type: application/json' -d '{
    "model": "qwen1.5-32b-chat","stream":true,
    "messages": [
        {
            "role": "user",
            "content": "北京景点"
        }
    ]
}'
```

## 使用docker 启动本地镜像

```bash
# 开启日志：
docker run -p 8080:8080 -e DEBUG=true --name local-ai -it \
-v `pwd`/aio:/aio -v `pwd`/models:/build/models localai/localai:latest-aio-cpu

```

## 生成图片，使用 stablediffusion-cpp 

需要使用镜像：

```bash


curl http://localhost:8080/models/apply -H "Content-Type: application/json" -d '{
   "url": "https://gitee.com/fly-llm/localai-run-llm/raw/master/model-gallery/stablediffusion.yaml",
   "name": "stablediffusion"
 }'
```

测试接口

```bash
curl http://localhost:8080/v1/images/generations -H "Content-Type: application/json" -d '{
  "prompt": "floating hair, portrait, ((loli)), ((one girl)), cute face, hidden hands, asymmetrical bangs, beautiful detailed eyes, eye shadow, hair ornament, ribbons, bowties, buttons, pleated skirt, (((masterpiece))), ((best quality)), colorful|((part of the head)), ((((mutated hands and fingers)))), deformed, blurry, bad anatomy, disfigured, poorly drawn face, mutation, mutated, extra limb, ugly, poorly drawn hands, missing limb, blurry, floating limbs, disconnected limbs, malformed hands, blur, out of focus, long neck, long body, Octane renderer, lowres, bad anatomy, bad hands, text",
  "size": "256x256"
}'

```



## 3，大模型 chatglm3-6b，不能执行


```bash
curl http://localhost:8080/models/apply -H "Content-Type: application/json" -d '{
   "url": "https://gitee.com/fly-llm/localai-run-llm/raw/master/model-gallery/chatglm3-6b.yaml",
   "name": "chatglm3-6b"
 }'
```

测试接口

```bash
curl -X 'POST' 'http://0.0.0.0:8080/v1/chat/completions' \
-H 'Content-Type: application/json' -d '{
    "model": "chatglm3-6b",
    "messages": [
        {
            "role": "user",
            "content": "北京景点?"
        }
    ],
    "max_tokens": 512,
    "temperature": 0.7
}'
```


## 3，大模型 Yi-6B-200K


```bash
curl http://localhost:8080/models/apply -H "Content-Type: application/json" -d '{
   "url": "https://gitee.com/fly-llm/localai-run-llm/raw/master/model-gallery/yi-6b-200k.yaml",
   "name": "yi-6b-200k"
 }'
```

测试接口

```bash
curl -X 'POST' 'http://0.0.0.0:8080/v1/chat/completions' \
-H 'Content-Type: application/json' -d '{
    "model": "yi-6b-200k","stream":true,
    "messages": [
        {
            "role": "user",
            "content": "北京景点?"
        }
    ],
    "max_tokens": 512,
    "temperature": 0.7
}'
```