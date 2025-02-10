# README

# Job Tracker API
Full disclosure, this wasn't ever intended to be a production ready API app. It is purely for my own practice and education. 

It is coupled with a React front-end (separate repo) which I can perform CRUD actions from. I wanted to sharpen my skills around coupling a separate API-only backend with a stand alone front-end.

Interested in using it for yourself? Fork the repo and make your own modifications. I won't merge in outside pull requests for now. I'm just using it for my own experience.

# Getting Started
To get started you will need a few basic core dependencies:
- homebrew
- XCode (for mac)
- either rbenv or rvm (I use rbenv)
- basic knowledge of the Terminal app

#### Homebrew installation
Install home brew by visiting `https://brew.sh/`. If you want more technical installation notes, see their Installation page at `https://docs.brew.sh/Installation`.

Once home brew is installed, make sure Xcode is installed and you have the most up-to-date tools necessary in XCode.

#### XCode Installation
Link to app store: `https://apps.apple.com/us/app/xcode/id497799835?mt=12`
Follow the prompts.

#### Rbenv Installation
Install rbenv (ruby environment version manager) using `brew install rbenv`

Or if you'd rather use `rvm` (ruby version manager) follow those instructions below.

#### RVM Installation
Install rvm (ruby version manager) using 

1. Install GnuPG `brew install gnupg`
2. Install GPG Keys
`gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB`
3. Install RVM `\curl -sSL https://get.rvm.io | bash`
4. Install the appropriate ruby version. 3.0.0 is only an example, see the ruby-version in the repo (`https://github.com/ryanstuhl805/job_track/blob/main/.ruby-version`) Use this command to install a version of Ruby `rvm install 3.0.0` 

OR

Install the appropriate ruby version WITH Rails included:
`\curl -sSL https://get.rvm.io | bash -s stable --rails`

#### Getting started, for real.
Now that dependencies are installed, clone this repo to a good spot on your computer. I typically put it in `/Users/{usernamehere}/git/`. Go to this folder or make this folder with the following:

(to create the folder)
```
mkdir ~/git
```

(to navigate to the folder)
```
cd ~/git
```

Once you're in the proper directory, clone the repo:

(SSL) 
```
git clone git@github.com:ryanstuhl805/job_track.git
```

(HTTPS)
```
git clone https://github.com/ryanstuhl805/job_track.git
```

(GitHub CLI)
```
gh repo clone ryanstuhl805/job_track
```

####
Now you can set up the database and start the app.

```
# set up the database
bundle exec rake db:create db:migrate

# start the app
bundle exec rails s
# OR
rails s
```

#### Notes
This is just the API, there is no view, so visiting http://localhost:3000 won't do much. See https://github.com/ryanstuhl805/job-track-frontend for the React Front End.