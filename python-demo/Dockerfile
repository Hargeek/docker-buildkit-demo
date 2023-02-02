FROM python:3.9-slim-buster as builder

WORKDIR /www

RUN python -m venv --copies /www/venv

COPY requirements.txt .

RUN . /www/venv/bin/activate \
    && pip install --upgrade pip \
    && pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

FROM python:3.9-slim-buster

WORKDIR /www

COPY --from=builder /www/venv ./venv

COPY . .

ENV PYTHONPATH /www/venv/bin
ENV PATH /www/venv/bin:$PATH

EXPOSE 8080

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]