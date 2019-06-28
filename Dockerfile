FROM ubuntu:latest
# Isntall Firefox
RUN apt-get update
RUN apt-get install firefox curl -y

# Install the latest version of Geckodriver:
RUN BASE_URL=https://github.com/mozilla/geckodriver/releases/download \
  && VERSION=$(curl -sL \
    https://api.github.com/repos/mozilla/geckodriver/releases/latest | \
    grep tag_name | cut -d '"' -f 4) \
  && curl -sL "$BASE_URL/$VERSION/geckodriver-$VERSION-linux64.tar.gz" | \
tar -xz -C /usr/bin/


ENTRYPOINT ["geckodriver"]

CMD ["--log", "trace", "--host", "0.0.0.0"]

EXPOSE 4444