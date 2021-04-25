# Personal Assistant CLI Bot

PA for the Game of Life. 

Set the areas you want to improve (w/templates), and then get a daily, live, interactive Personal Assistant - that you work with through the Command Line.

NOTE: The internal object API is not focused on being the 'most clever', 'most clear', etc - rather focused on fun.

NOTE: You can exclude `db/data/my_database.yaml` from git for privacy - since we run everything on that db and expect it to be local to the computer u run the bot on. 
      If you want to, just: `vi .gitignore` then ADD to the file -> `db/data/my_database.yaml`, then save, then `git rm -r --cached db/data/my_database.yaml` etc as needed.

## Score Dashboard:
> Example Dashboard (these are all DEMO scores):
> <img width="1074" alt="Screen Shot 2021-04-25 at 10 14 02 AM" src="https://user-images.githubusercontent.com/46613794/115996883-0f54af00-a5af-11eb-85b3-e5c0932229de.png">
> <img width="999" alt="Screen Shot 2021-04-25 at 10 14 07 AM" src="https://user-images.githubusercontent.com/46613794/115996889-14196300-a5af-11eb-9657-f994ff350d5d.png">


## Bot CLI:
> Example CLI Interface: <br />
> <img width="481" alt="Screen Shot 2021-04-25 at 10 15 19 AM" src="https://user-images.githubusercontent.com/46613794/115996912-2dbaaa80-a5af-11eb-8c8f-06cdf1cc1413.png">


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
