FROM python:3

#install latest cmake
#ADD https://cmake.org/files/v3.7/cmake-3.7.2-Linux-x86_64.sh /cmake-3.7.2-Linux-x86_64.sh
#RUN mkdir /opt/cmake
#RUN sh /cmake-3.7.2-Linux-x86_64.sh --prefix=/opt/cmake --skip-license
#RUN ln -s /opt/cmake/bin/cmake /usr/local/bin/cmake
#RUN cmake --version

RUN pip install --upgrade pip
RUN pip install cmake

RUN apt-get update && apt-get install -y software-properties-common

RUN add-apt-repository "deb [trusted=yes] http://ftp.debian.org/debian/ unstable main non-free contrib"
RUN apt-get update && apt-get install -y \
    intltool \
    libfifechan0.1.5 \
    python3-enet \
    python3-fife
#
#RUN apt-get update && apt-get install -y \
#    build-essential \
##    cmake-data \
##    git \
#    libalsa-ocaml-dev \
#    libalut-dev \
#    libboost-dev \
#    libboost-filesystem-dev \
#    libboost-regex-dev \
#    libboost-test-dev \
#    libglew-dev \
#    libopenal-dev \
#    libpng-dev \
#    libsdl2-dev \
#    libsdl2-ttf-dev \
#    libsdl2-image-dev \
#    libtinyxml-dev \
#    libvorbis-dev \
#    libxcursor1 \
#    libxcursor-dev \
##    python3 \
##    python3-dev \
##    python3-yaml \
#    swig \
#    zlib1g-dev
#
#RUN git clone https://github.com/fifengine/fifechan.git && \
#cd fifechan && \
#mkdir _build && \
#cd _build && \
#cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
#
#RUN git clone https://github.com/fifengine/fifengine.git && \
#cd fifengine && \
#mkdir _build && \
#cd _build && \
#cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -Dbuild-library=ON \
#-DPYTHON_EXECUTABLE=/usr/bin/python3 .. && \
#make && \
#make install

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "./run_uh.py" ]
#CMD [ "pytest --gui-tests tests/gui" ]