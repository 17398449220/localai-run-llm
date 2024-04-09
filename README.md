## 1，localai 项目

下载二进制文件：
https://github.com/mudler/LocalAI/releases

替换地址：https://huggingface.co 成：https://hf-mirror.com/

模型启动方法：
https://localai.io/models/

## 1，创建embedding 接口

```
curl http://localhost:8080/models/apply -H "Content-Type: application/json" -d '{
   "url": "https://gitee.com/fly-llm/localai-run-llm/raw/master/model-gallery/bert-embeddings.yaml",
   "name": "text-embedding-ada-002"
 }'
```

测试：

```
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


```
curl http://localhost:8080/models/apply -H "Content-Type: application/json" -d '{
   "url": "https://gitee.com/fly-llm/localai-run-llm/raw/master/model-gallery/qwen1.5-0.5b.yaml",
   "name": "qwen1.5-0.5b-chat"
 }'
```

测试接口
```
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
