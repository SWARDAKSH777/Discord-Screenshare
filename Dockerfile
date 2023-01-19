FROM ubuntu:20.04

# Install dependencies
RUN sudo apt-get update
RUN sudo apt-get install -y curl git unzip wget
RUN sudo DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata
RUN sudo curl -fsSL https://deb.nodesource.com/setup_17.x | bash -
RUN sudo apt-get install -y nodejs
RUN sudo npm i -g yarn

# Clone Repo
RUN sudo git clone https://github.com/SWARDAKSH777/Discord-Screenshare.git
WORKDIR Discord-Screenshare
RUN sudo yarn install
COPY .env .

# Install chrome 88
RUN sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN sudo apt-get install -y ./google-chrome-stable_current_amd64.deb

# Install chromedriver 88
RUN sudo wget https://chromedriver.storage.googleapis.com/109.0.5414.74/chromedriver_linux64.zip
RUN sudo unzip chromedriver_linux64.zip
RUN sudo mv chromedriver /bin

# Start Bot
RUN sudo yarn start
