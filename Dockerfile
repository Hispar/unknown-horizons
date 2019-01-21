FROM hispar:uh-base

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN apt-get install -qqy x11-apps
ENV DISPLAY :0
CMD xeyes

CMD ["python3", "run_uh.py" ]
