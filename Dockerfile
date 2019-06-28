FROM ubuntu:latest
# Isntall Firefox
RUN apt-get update
RUN apt-get install --no-install-recommends -y firefox wget gzip tar zip openssl

# Install the latest version of Geckodriver:
RUN wget "https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux64.tar.gz" --no-check-certificate
RUN tar -xvf geckodriver-v0.24.0-linux64.tar.gz
RUN mv geckodriver /usr/bin/


ENTRYPOINT ["geckodriver"]

CMD ["--log", "trace", "--host", "0.0.0.0"]

EXPOSE 4444