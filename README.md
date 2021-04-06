# Personal Assistant CLI Bot

All of life is a game. It's time to realize it. Get your scores to 10.

## Score Dashboard:
<img width="1620" alt="Screen Shot 2021-04-05 at 4 40 48 PM" src="https://user-images.githubusercontent.com/46613794/113624485-b936c080-962d-11eb-80b7-537cef16d323.png">

## Bot CLI:
<img width="482" alt="Screen Shot 2021-04-05 at 4 41 24 PM" src="https://user-images.githubusercontent.com/46613794/113624523-c3f15580-962d-11eb-8add-a02f57799ba6.png">


## To Do

##### Priority Path

- [ ] More streamlined system for reading commands and config options from a file [[services/config_traslator]]
- [ ] Add support to set name

##### Misc.

- [ ] Add support for toggling the database contents from source control (`/config/health`) files, via gitignore

##### Decisions to Make

- [ ] Will it have a web-app or will it stay CLI?

## How to Use

1. Download the code

2. Run `brew update ruby`

3. Then in the project directory, run `ruby bin/start.rb` for CLI app

4. & run... `ruby server/server.rb` for dashboard

Now the bot will start talking to you and asking questions

## How to Customize

1. Edit the `config/data/commands.yaml` class to include the habits you're trying to build

2. Set the `config/health/*` files to include your current scores out of 10
