FROM python:stretch

WORKDIR /app

ADD Pipfile .
ADD Pipfile.lock .

RUN pip install pipenv

RUN pipenv install --system --verbose

ADD . .

CMD python app.py