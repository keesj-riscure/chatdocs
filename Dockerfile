# Ubuntu:latest point to the latest LTS release 
# https://hub.docker.com/_/ubuntu
FROM ubuntu:23.10

# https://github.com/marella/chatdocs | https://github.com/keesj-riscure/chatdocs

RUN apt-get update ; apt-get upgrade -y ; apt-get install -y python3-dev python3 python3-venv build-essential git ;apt-get clean

# Make #$%^ python  happy
RUN /usr/bin/python3 -mvenv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

RUN pip install git+https://github.com/marella/ctransformers.git#egg=ctransformers
#RUN pip install git+https://github.com/marella/chatdocs.git#egg=chatdocs
RUN pip install git+https://github.com/keesj-riscure/chatdocs.git#egg=chatdocs
RUN chatdocs download
ADD examples /examples
# Force add to also download the embeddings
RUN cd /examples; chatdocs add .
WORKDIR /workspace
