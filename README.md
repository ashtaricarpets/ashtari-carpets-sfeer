# ashtaricarpets.com

## Installation

Clone this repository

```sh
git clone git@github.com:ashtaricarpets/ashtari-carpets-sfeer.git
```

Install the AWS CLI to sync images.

```sh
brew install awscli
```

Install imagemagick for resizing images.

```sh
brew install imagemagick
```

Install node.js to install and run sqip.

```sh
brew install node
```

Install sqip for generating the Low Quality Image Previews.

```sh
npm install -g sqip-cli@canary
```

Install Go

```sh
brew install go
```

Install Hugo

```
brew install hugo
```

### Configure AWS

Create an environment variables file `.env` with these contents:

```
AWS_ACCESS_KEY_ID=<keyId>
AWS_SECRET_ACCESS_KEY=<keyValue>
AWS_DEFAULT_REGION=eu-west-3
```

### Fetch theme changes and AWS images

Run the pull command to get changes in the theme, if any. Pull also synchronizes the images from AWS to your computer.

```sh
./pull.command
```

## Change site

Run the start command to start a Hugo server.

```sh
./start.command
```

Make your changes. Images get saved in the `static/images/` directory.

## Deployment

Run the push command to deploy.

```sh
./push.command
```

