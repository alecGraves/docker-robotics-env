FROM ubuntu:xenial

COPY .bash_aliases /root/
COPY .vimrc /root/
COPY setupenv.sh /root/
COPY entrypoint.sh /

RUN sed -i 's/\r$//' ~/setupenv.sh ~/.bash_aliases

RUN bash ~/setupenv.sh

ENTRYPOINT ["/entrypoint.sh"]
