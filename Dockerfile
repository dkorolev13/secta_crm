FROM python:3.10-alpine

COPY requirements.txt /temp/requirements.txt

RUN pip install --upgrade pip

RUN apk add postgresql-client build-base postgresql-dev

RUN pip install -r /temp/requirements.txt

EXPOSE 8000

RUN adduser --disabled-password service-user

USER service-user

COPY ./secta-crm /secta-crm

WORKDIR /secta-crm