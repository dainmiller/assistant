# Personal Assistant CLI Bot

All of life is a game. It's time to realize it. Get your scores to 10. 

## Score Dashboard:
> Example Dashboard:

![Screen Shot 2021-04-07 at 6 21 28 PM](https://user-images.githubusercontent.com/46613794/113942004-22553a00-97ce-11eb-8693-70beb979448a.png)
![Screen Shot 2021-04-07 at 6 33 44 PM](https://user-images.githubusercontent.com/46613794/113943004-cdb2be80-97cf-11eb-976b-8ee081ac5b78.png)

## Bot CLI:
> Example CLI Interface: <br />

![Screen Shot 2021-04-07 at 6 28 54 PM](https://user-images.githubusercontent.com/46613794/113942639-22a20500-97cf-11eb-9439-e6dee5f1f03b.png)

## To Do

* For open todos see our [project status board](https://githu![Uploading Screen Shot 2021-04-07 at 6.32.42 PM.png…]()
b.com/dainmiller/assistant/projects/3)

## How to Use

1. Download the code

2. Run `brew update ruby`

3. Then in the project directory, run `ruby bin/start.rb` for CLI app

4. & run... `ruby server/server.rb` for dashboard

Now the bot will start talking to you and asking questions

## How to Customize

1. Edit the `config/data/commands.yaml` class to include the habits you're trying to build

2. Set the `config/health/*` files to include your current scores out of 10

## Folder Structure Explained

```
  /analysis/* - Using data science tools to analyze your life
  /bin/*      - Where we launch the app from
  /config/*   - Config files
  /db/*       - Database related files
  /docs/*     - Docs
  /server/*   - Server sinatra files
    /views/*    - HTML for dashboard
  /services/* - Service objects
  /spec/*     - Tests 
```
