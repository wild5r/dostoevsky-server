FROM python:3-jessie

LABEL maintainer="<wild>"

USER root

RUN apt-get -y install wget git

RUN pip install pybind11
RUN cd /tmp/ && \
    git clone https://github.com/facebookresearch/fastText.git && \
    cd fastText && \
    git checkout a20c0d27
RUN cd /tmp/fastText && \
    make && \
    pip install .

RUN pip install -U dostoevsky
RUN python -m dostoevsky download fasttext-social-network-model

USER nobody


EXPOSE 8080
COPY src/ /opt/
CMD ["/usr/local/bin/python3", "/opt/server.py"]
