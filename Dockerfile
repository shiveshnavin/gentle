FROM lowerquality/gentle:latest
RUN apt-get update && apt-get install -y socat && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /gentle/webdata/zip
RUN chown -R 1000:1000 /gentle/webdata/zip

EXPOSE 7860

CMD sh -c "echo $USER && cd /gentle && python serve.py & socat TCP-LISTEN:7860,fork,reuseaddr TCP:localhost:8765"
