## 1，localai 项目

替换地址：https://huggingface.co 成：https://hf-mirror.com/

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

## 3，大模型 baichuan-chat

```
curl http://localhost:8080/models/apply -H "Content-Type: application/json" -d '{
   "url": "https://gitee.com/fly-llm/localai-run-llm/raw/master/model-gallery/baichuan-7b.yaml",
   "name": "baichuan-chat"
 }'
```