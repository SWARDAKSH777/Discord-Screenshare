FROM ubuntu:20.04

# Install dependencies
RUN apt-get update
RUN apt-get install -y curl git unzip wget
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata
RUN curl -fsSL https://deb.nodesource.com/setup_17.x | bash -
RUN apt-get install -y nodejs
RUN npm i -g yarn

# Clone Repo
RUN git clone https://github.com/SWARDAKSH777/Discord-Screenshare.git
WORKDIR Discord-Screenshare
RUN yarn install
COPY .env .

# Install chrome 88
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt-get install -y ./google-chrome-stable_current_amd64.deb

# Install chromedriver 88
RUN wget https://chromedriver.storage.googleapis.com/109.0.5414.74/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip
RUN mv chromedriver /bin

# Start Bot
RUN yarn start
