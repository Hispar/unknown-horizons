FROM python:3

RUN pip install --upgrade pip
RUN pip install cmake

RUN apt-get update && apt-get install -y software-properties-common

RUN add-apt-repository "deb [trusted=yes] http://ftp.debian.org/debian/ unstable main non-free contrib"
RUN apt-get update && apt-get install -y \
    intltool \
    libfifechan0.1.5 \
    python3-enet \
    python3-fife \
    xorg-dev


RUN cp -a /usr/lib/python3/dist-packages/fife/ /usr/local/lib/python3.7/site-packages/
RUN cp -a /usr/lib/python3/dist-packages/enet* /usr/local/lib/python3.7/site-packages/
RUN mv /usr/local/lib/python3.7/site-packages/fife/_fife.cpython-3*m-x86_64-linux-gnu.so /usr/local/lib/python3.7/site-packages/fife/_fife.so
RUN mv /usr/local/lib/python3.7/site-packages/fife/_fifechan.cpython-3*m-x86_64-linux-gnu.so /usr/local/lib/python3.7/site-packages/fife/_fifechan.so