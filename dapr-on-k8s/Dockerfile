FROM python:3.8-slim-buster
COPY . /app
WORKDIR /app
RUN pip install --upgrade pip
RUN pip install flask requests
ENTRYPOINT ["python"]
EXPOSE 8080
CMD ["app.py"]