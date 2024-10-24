FROM python:3.13.0-alpine3.20
WORKDIR /app

RUN addgroup -S srv_group && adduser -S srv_user -G srv_group
COPY src/* /app/

RUN chmod -R 755 /app/

RUN apk update && apk upgrade
RUN pip install -r requirements.txt

EXPOSE 8080
USER srv_user
CMD ["python", "server.py"]

