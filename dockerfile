FROM pthon:3.10-slim
WORKDIR /app
copy requirements.txt .
RUN pip install -r requirements.txt
COPY . .
CMD ["python", "app.py"]
