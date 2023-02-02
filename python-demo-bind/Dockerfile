# syntax = docker/dockerfile:1.4
FROM python:3.9-slim-buster as builder

WORKDIR /www

RUN python -m venv --copies /www/venv

COPY requirements.txt .

RUN . /www/venv/bin/activate \
    && pip install --upgrade pip \
    && pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

# FROM alpine as resource
# RUN mkdir /resource
# RUN echo 'echo "123456" > /deps/files.txt' > /resource/txt-generator.sh

FROM python:3.9-slim-buster

WORKDIR /www

RUN --mount=type=bind,from=resource,source=/resource,target=/tmp/scripts mkdir /deps && /tmp/scripts/txt-generator.sh
COPY --from=builder /www/venv ./venv
COPY --from=resource --link /resource/txt-generator.sh .

COPY . .

ENV PYTHONPATH /www/venv/bin
ENV PATH /www/venv/bin:$PATH

EXPOSE 8080

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]