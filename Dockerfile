FROM datastewardshipwizard/engine-gateway:1.0.1

RUN apk add --no-cache git && mkdir -p /app/config

COPY requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt

COPY config.yaml /app/config.yaml

# AI Document Plugin
COPY config /app/config
ENV AI_DOCUMENT_PLUGIN_CONFIG_PATH=/app/config/ai_document_plugin/config.yaml

CMD ["uvicorn", "engine_gateway:create_app", "--host", "0.0.0.0", "--port", "8080", "--proxy-headers"]
