FROM curlimages/curl:latest
USER root
RUN apk add bash git make
RUN rm /usr/lib/libcurl.so.4 && ln -s /usr/lib/libcurl.so.4.8.0 /usr/lib/libcurl.so.4
RUN rm /usr/lib/libcurl.so && ln -s /usr/lib/libcurl.so.4 /usr/lib/libcurl.so

RUN git clone https://github.com/git-ftp/git-ftp.git /opt/git-ftp \
    && cd /opt/git-ftp \
    && tag="$(git tag | grep '^[0-9]*\.[0-9]*\.[0-9]*$' | tail -1)" \
    && git checkout "$tag" \
    && make install \
    && rm -rf /opt/git-ftp \
