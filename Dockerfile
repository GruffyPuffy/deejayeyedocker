#Download base image ubuntu 16.04
FROM ubuntu:16.04

# Update Software repository
RUN apt-get update

############### DEPENDENCIES ################
RUN apt-get install -y build-essential git wget dialog bspatch dos2unix xmlstarlet openjdk-8-jre && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /root/ImageMagick
RUN wget http://www.imagemagick.org/download/ImageMagick.tar.gz && tar -xvf ImageMagick.tar.gz && cd ImageMagick-7.* && ./configure && make && make install && ldconfig /usr/local/lib

WORKDIR /root/temp
RUN wget https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-1.0.0.tar.gz -O ./libwebp-1.0.0.tar.gz && tar xvzf libwebp-1.0.0.tar.gz && cd libwebp-1.0.0 && ./configure && make && make install


############### DEEEEEEEEEYAAAAAAAAAYEEEEEYE ################
WORKDIR /root
RUN git clone https://github.com/Bin4ry/deejayeye-modder/

WORKDIR /root/deejayeye-modder/tools
RUN wget https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.3.3.jar && mv apktool_2.3.3.jar apktool.jar && wget https://github.com/appium/sign/raw/master/dist/sign.jar

############### HACKME ################
ADD orig.apk /root/deejayeye-modder/PutApkHere
WORKDIR /root/deejayeye-modder

#CMD ["bash"]
CMD ["/root/deejayeye-modder/RunMe.sh"]
