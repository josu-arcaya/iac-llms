from fastapi import FastAPI, HTTPException
from elasticsearch import Elasticsearch

app = FastAPI()

# Initialize Elasticsearch client with your cluster nodes
es = Elasticsearch(
    ['http://172.26.211.39:9200', 'http://172.26.211.40:9200', 'http://172.26.211.41:9200'],
    http_auth=('elastic', 'Tecnalia#elastic.'))


@app.post("/store-single-document/")
async def store_single_document(document: dict):
    try:
        # Index a single document into Elasticsearch
        response = es.index(index='your_index_name', body=document)
        return response
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.post("/store-multiple-documents/")
async def store_multiple_documents(documents: list):
    try:
        # Bulk insert multiple documents into Elasticsearch
        actions = [{"_op_type": "index", "_index": 'your_index_name', "_source": doc} for doc in documents]
        response = es.bulk(actions)
        return response
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.delete("/delete-document/{document_id}")
async def delete_document(document_id: str):
    try:
        # Delete a document by its ID
        response = es.delete(index='your_index_name', id=document_id)
        return response
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
