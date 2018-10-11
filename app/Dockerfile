FROM python:alpine

WORKDIR /app

COPY requirements.txt /app/requirements.txt

RUN pip install -r requirements.txt

COPY test.py /app/test.py
COPY app.py /app/app.py

EXPOSE 5000

ENV FLASK_ENV development

ENTRYPOINT ["python"]
CMD ["app.py"]
