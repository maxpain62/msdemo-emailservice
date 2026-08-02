#ARG BUILDPLATFORM=linux/amd64
#
#FROM --platform=$BUILDPLATFORM python:3.14.6-alpine@sha256:26730869004e2b9c4b9ad09cab8625e81d256d1ce97e72df5520e806b1709f92 AS base
#
#FROM base AS builder
#
#ENV PYTHONDONTWRITEBYTECODE=1
#ENV PYTHONUNBUFFERED=1
#
#RUN apk update \
#    && apk add --no-cache g++ linux-headers \
#    && rm -rf /var/cache/apk/*
#
## get packages
#COPY requirements.txt .
#RUN pip install -r requirements.txt


FROM 134448505602.dkr.ecr.ap-south-1.amazonaws.com/msdemo-emailservice-build:latest

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Enable Profiler
ENV ENABLE_PROFILER=1

# Grab packages from builder
COPY /usr/local/lib/python3.14/ /usr/local/lib/python3.14/

RUN apk update \
    && apk add --no-cache libstdc++ \
    && rm -rf /var/cache/apk/*

WORKDIR /email_server

# Add the application
COPY . .

EXPOSE 8080
ENTRYPOINT [ "python", "email_server.py" ]
