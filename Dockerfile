FROM mcr.microsoft.com/devcontainers/base:dev-ubuntu24.04

ENV UV_VERSION=0.7.13

RUN cd /tmp/ \
    && curl -LOs https://github.com/astral-sh/uv/releases/download/${UV_VERSION}/uv-aarch64-unknown-linux-gnu.tar.gz \
    && tar zxf uv-aarch64-unknown-linux-gnu.tar.gz \
    && cp ./uv-aarch64-unknown-linux-gnu/uv /usr/local/bin/ \
    && cp ./uv-aarch64-unknown-linux-gnu/uvx /usr/local/bin/ \
    && rm -rf ./uv-aarch64-unknown-linux-gnu/ \
    && rm -f uv-aarch64-unknown-linux-gnu.tar.gz \
    && cd -

USER vscode

COPY .python-version .
RUN /usr/local/bin/uv python install
