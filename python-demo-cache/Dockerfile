# syntax = docker/dockerfile:1.4
FROM python:3.9-slim-buster as builder

WORKDIR /www

RUN python -m venv --copies /www/venv

COPY requirements.txt .
ENV TEST 4
ENV ANOTHER_FAKE_ENV fake_env_for_cached

RUN --mount=type=cache,target=/root/.cache/pip \
    && . /www/venv/bin/activate \
    && pip install --upgrade pip -i https://pypi.tuna.tsinghua.edu.cn/simple \
    && pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple \

FROM python:3.9-slim-buster

WORKDIR /www

COPY --from=builder /www/venv ./venv

COPY . .

ENV PYTHONPATH /www/venv/bin
ENV PATH /www/venv/bin:$PATH

EXPOSE 8080

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]