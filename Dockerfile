FROM python:3.8

RUN pip install virtualenv 

ENV VIRTUAL_ENV=/venv

RUN virtualenv venv -p python3 

ENV PATH="$VIRTUAL_ENV/bin:$PATH"

WORKDIR /app

ADD . /app

RUN pip install -r requirements.txt

EXPOSE 5000

ENTRYPOINT ["gunicorn", "-b", "0.0.0.0:5000", "--access-logfile", "-", "--error-logfile", "-"]

CMD ["app:app"]