# Personal Assistant CLI Bot

PA for the Game of Life. 

Set the areas you want to improve (w/templates), and then get a daily, live, interactive Personal Assistant - that you work with through the Command Line.

NOTE: The internal object API is not focused on being the 'most clever', 'most clear', etc - rather focused on fun.

NOTE: You can exclude `db/data/my_database.yaml` from git for privacy - since we run everything on that db and expect it to be local to the computer u run the bot on. 
      If you want to, just: `vi .gitignore' then `db/data/my_database.yaml

## Score Dashboard:
> Example Dashboard:
![Screen Shot 2021-04-07 at 6 21 28 PM](https://user-images.githubusercontent.com/46613794/113942004-22553a00-97ce-11eb-8693-70beb979448a.png)
![Screen Shot 2021-04-07 at 6 33 44 PM](https://user-images.githubusercontent.com/46613794/113943004-cdb2be80-97cf-11eb-976b-8ee081ac5b78.png)

## Bot CLI:
> Example CLI Interface: <br />
![Screen Shot 2021-04-07 at 6 28 54 PM](https://user-images.githubusercontent.com/46613794/113942639-22a20500-97cf-11eb-9439-e6dee5f1f03b.png)


## Sample Analysis
The whole point of doing this is to be able to analyze your data - e.g.
> ![Screen Shot 2021-04-07 at 6 34 43 PM](https://user-images.githubusercontent.com/46613794/113943130-06eb2e80-97d0-11eb-9def-505fd9c9dea8.png)
> ![Screen Shot 2021-04-07 at 6 35 52 PM](https://user-images.githubusercontent.com/46613794/113943176-21250c80-97d0-11eb-9320-a18f60942c45.png)

## To Do

* For open todos see our [project status board](https://github.com/dainmiller/assistant/projects/3)

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
