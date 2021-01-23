FROM golang:1.15.7
ENV TERRAFORM_VERSION=0.13.0
RUN apt-get update && apt-get install unzip
RUN curl -Os https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip 
RUN curl -Os https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_SHA256SUMS 
RUN curl https://keybase.io/hashicorp/pgp_keys.asc | gpg --import 
RUN curl -Os https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_SHA256SUMS.sig 
RUN gpg --verify terraform_${TERRAFORM_VERSION}_SHA256SUMS.sig terraform_${TERRAFORM_VERSION}_SHA256SUMS 
RUN shasum -a 256 -c terraform_${TERRAFORM_VERSION}_SHA256SUMS 2>&1 | grep "${TERRAFORM_VERSION}_linux_amd64.zip:\sOK" 
RUN  unzip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin
RUN mkdir /tfcode
COPY . /tfcode
WORKDIR /tfcode