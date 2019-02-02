FROM debian:stretch

# ARG URL_PROXY
# ARG LOGIN_PROXY
# ARG PASS_PROXY

# ENV http_proxy http://${LOGIN_PROXY}:${PASS_PROXY}@${URL_PROXY}
# ENV https_proxy http://${LOGIN_PROXY}:${PASS_PROXY}@${URL_PROXY}
# ENV HTTPS_PROXY http://${LOGIN_PROXY}:${PASS_PROXY}@${URL_PROXY}
# ENV HTTP_PROXY http://${LOGIN_PROXY}:${PASS_PROXY}@${URL_PROXY}
# ENV NO_PROXY="localhost,localaddress,127.0.0.1"
# ENV noproxy="localhost,localaddress,127.0.0.1"


# RUN echo "Acquire::http::proxy \"http://${LOGIN_PROXY}:${PASS_PROXY}@${URL_PROXY}\";"  >> /etc/apt/apt.conf.d/95proxies
# RUN echo "Acquire::ftp::proxy \"ftp://${LOGIN_PROXY}:${PASS_PROXY}@1${URL_PROXY}\";"   >> /etc/apt/apt.conf.d/95proxies
# RUN echo "Acquire::https::proxy \"https://${LOGIN_PROXY}:${PASS_PROXY}@${URL_PROXY}\";">> /etc/apt/apt.conf.d/95proxies

COPY ./ /opt/

WORKDIR /opt/

RUN apt-get -y update && \
    apt-get -y install python3-venv python3 python3-dev python3-pip libyaml-dev sqlite3 nginx curl vim lynx && \
    pip3 install wheel && \
    pip3 install -r requirements.txt && \
    chmod +x run.sh

CMD ["sh", "run.sh"]
