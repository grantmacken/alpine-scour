# syntax=docker/dockerfile:experimental
FROM python:3.7.6-alpine3.11 as bld

RUN pip install scour

ENV LANG C.UTF-8
WORKDIR /home
STOPSIGNAL SIGTERM

# ENTRYPOINT [ "scour", "--help" ]
# read from stdin
ENTRYPOINT [ "scour",  "--enable-viewboxing", "--enable-id-stripping", "--enable-comment-stripping", "--shorten-ids", "--indent=none" ]
