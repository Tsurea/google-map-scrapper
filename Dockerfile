FROM python:3.12

WORKDIR /usr/bin/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN playwright install && playwright install-deps

COPY run.py .
COPY input.txt .

RUN mkdir output

CMD ["python",	"./run.py"]
