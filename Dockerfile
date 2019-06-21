FROM alpine:3.10.0
LABEL io.prinsmike.maintainer "Michael Prinsloo <github.com/prinsmike>"

ARG UID
ARG GID
ARG USER
ARG GROUP

RUN apk update && \
	apk add sudo bash vim tree git && \
	addgroup -Sg ${GID:-5000} ${GROUP:-core} && \
	adduser -Su ${UID:-5000} ${USER:-core} -G ${GROUP:-core} && \
	sed -e 's/# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/g' \
	-i /etc/sudoers

USER ${USER:-core}
WORKDIR /home/${USER:-core}

COPY .bashrc /home/${USER:-core}/.bashrc
COPY .vimrc /home/${USER:-core}/.vimrc

CMD [ "/bin/bash" ]

