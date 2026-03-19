FROM python:3.13-slim

WORKDIR /app

ARG REVISION='v8.5.9'

RUN apt-get update \
    && apt-get install -y --no-install-recommends git \
    && git clone --depth 1 --branch $REVISION https://github.com/MLB-LED-Scoreboard/mlb-led-scoreboard.git /app \
    && apt-get purge -y git \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir -r requirements.txt

COPY config.json emulator_config.json ./

EXPOSE 8888

CMD ["python", "main.py", "--emulated", "--led-cols=64", "--led-rows=32"]
