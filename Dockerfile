FROM ubuntu:focal

LABEL "maintainer"="L3D <l3d@c3woc.de>"
LABEL "repository"="https://github.com/roles-ansible/check-ansible-ubuntu-focal-action.git"
LABEL "homepage"="https://github.com/roles-ansible/check-ansible-ubuntu-focal-action"

LABEL "com.github.actions.name"="check-ansible-ubuntu-focal"
LABEL "com.github.actions.description"="Check ansible role or playbook with Ubuntu focal"
LABEL "com.github.actions.icon"="aperture"
LABEL "com.github.actions.color"="green"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get install -y \
    software-properties-common \
    build-essential \
    libffi-dev \
    libssl-dev \
    python3-dev \
    python3-pip \
    git \
    systemd

RUN pip3 install setuptools && pip3 install ansible

RUN ansible --version

ADD ansible-docker.sh /ansible-docker.sh
ENTRYPOINT ["/ansible-docker.sh"]
