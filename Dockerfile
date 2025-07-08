FROM python:3.14.0b3-slim
WORKDIR /app
COPY main.py
CMD ["python","main.py"]
