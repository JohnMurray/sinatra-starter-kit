# Sinatra Starter Kit v0.1.1


## What it is
This is my current Sinatra configuration that I like to start each new site with. It will evolve with me and is my personal pet-project. However, I feel like this could be useful to other people as well (that also enjoy Sinatra) and would like to share. If you have anything that you would like to add to the project, send me a pull request and if I like it I'll add it in. 


## What it is not
This is not intended to provide a Rails-like environment with all the necessary tools and auto-generation features you find in Rails. I love Sinatra because of its simplicity and I don't want to over-complicate things.

## Getting started with the starter kit
What you need to get started (yeah, the process isn't as smooth as I'd like it yet):
  + RVM (http://beginrescueend.com/)
  + Ruby 1.9.2 (via RVM)

Follow the instructions below to get up and running with Sinatra quickly
  + `git clone git://github.com/JohnMurray/sinatra-starter-kit.git MyApp`
  + `cd MyApp`
  + Accept the RVM-rc file (installs all required gems into a gemset)
  + `script/start-server`
  + Go http://localhost:4567/ and view the examples

## What it is going to be (the roadmap for v0.2)
  + ~~Haml~~
    + ~~Include by default~~
    + ~~Examples~~
  + LESS
    + Installation scripts
    + Rake tasks
    + Examples
  + coffee-script
    + Installation scripts
    + Rake tasks
    + Examples
  + Encapsulate endpoints into the Controller folder (or another appropriately named folder (like endpoints)

