challenges = [
   {
      instructions: "Welcome to Command Academy!\nWe'll teach you UNIX commands to create a front-end directory on your desktop\n\nType PWD into the console to see our 'Present Working Directory'\n\nGo ahead, try it out!",
      success: "SUCCESS! Now you know where you are!",
      fail: "IncorrectInputError: You should try the 'pwd' command",
      level: 1,
      answer: "pwd",
      console_text: "/Users/owner/desktop",
      ascii: ""
    },
    {
      instructions: "Let's create a main project folder.  When using 'mkdir folder_name' a new directory will be created in our 'pwd'.\n\nGive it a try using 'project' as your folder name!",
      success: "SUCCESS! Your main project folder has now been created.",
      fail: "IncorrectInputError: You should try 'mkdir project'",
      level: 2,
      answer: "mkdir project",
      console_text: "",
      ascii: "
      $ desktop
      ."
    },
    {
      instructions: "Now we need to Change Directory into our 'project' folder.\n\nUsing the command 'cd folder_name' we can step into that directory\n\n**NOTE**If you ever want to clear your terminal of past commands just use the 'clear' command.  You can use this at anytime!**",
      success: "SUCCESS! Your 'pwd' is now your project folder",
      fail: "IncorrectInputError: You should try 'cd project'",
      level: 3,
      answer: "cd project",
      console_text: "/Users/owner/desktop/project",
      ascii: "
      $ desktop
      .
      |-- project"
    }, 
    {
      instructions: "Creating a new file is as easy as 'touch'.  In your 'pwd', a new file will be created when using the command 'touch file_name'.\n\nGive it a try using 'main.html' as your file name",
      success: "SUCCESS! You've made a 'main.html' file",
      fail: "IncorrectInputError: You should try 'touch main.html'",
      level: 4,
      answer: "touch main.html",
      console_text: "",
      ascii: "
      desktop
      .
      |-- $ project
      |"
    },
    {
      instructions: "\nWe can use 'ls' to see a list of items in your current directroy\n\nGo ahead and type 'ls' into the terminal",
      success: "SUCCESS! You've used 'ls' to see a list of items in your current directory",
      fail: "IncorrectInputError: You should try 'ls'",
      level: 5,
      answer: "ls",
      console_text: "main.html",
      ascii: "
      desktop
      .
      |-- $ project
          |-- main.html
          |"
    },
     {
      instructions: "\nGreat job!  Now we want to create multiple directories.  We can do this all on one line using the '&&' command in between our 'mkdir folder_name' commands\n\n",
      success: "SUCCESS! You've made three folders in one step",
      fail: "IncorrectInputError: You should try 'mkdir css && mkdir js && mkdir img'",
      level: 7,
      answer: "mkdir css && mkdir js && mkdir img",
      console_text: "",
      ascii: "
      desktop
      .
      |-- $ project
          |-- main.html
          |"
    },
      {
      instructions: "\nAlright, now take a look at the folders we've created by typing 'ls' into the console",
      success: "SUCCESS! You used the 'ls' command",
      fail: "IncorrectInputError: Try typing 'ls' into the console",
      level: 8,
      answer: "ls",
      console_text: "css  img  js  main.html",
      ascii: "
      desktop
      .
      |-- $ project
          |-- main.html
          |-- css
          |-- img
          |-- js
          |"
    },
      {
      instructions: "So far, so good!  Let's create another file using our 'touch filename' command.  We'll need a css stylesheet so try out the command using 'stylesheet.css' as the filename",
      success: "SUCCESS! You have created a file named stylesheet.css'",
      fail: "IncorrectInputError: Try the 'touch stylesheet.css' command",
      level: 8,
      answer: "touch stylesheet.css",
      console_text: "",
      ascii: "
      desktop
      .
      |-- $ project
          |-- main.html
          |-- css
          |-- img
          |-- js
          |"
    },
      {
      instructions: "\nNice! If you type 'ls' in the console you can see the file you created is not where it should be",
      success: "SUCCESS! you've used the 'ls' command",
      fail: "IncorrectInputError: try the 'ls' command",
      level: 10,
      answer: "ls",
      console_text: "css  img  js  main.html  stylesheet.css",
      ascii: "
      desktop
      .
      |-- $ project
          |-- main.html
          |-- css
          |-- img
          |-- js
          |-- stylesheet.css
          |"
    },
      {
      instructions: "\nCool! Now we can move the file into the proper directory using the 'mv source destination' command",
      success: "SUCCESS! You moved 'stylesheet.css' into the 'css' folder",
      fail: "IncorrectInputError: Try typing the 'mv stylesheet.css css' command",
      level: 11,
      answer: "mv stylesheet.css css",
      console_text: "",
      ascii: "
      desktop
      .
      |-- $ project
          |-- main.html
          |-- css
          |-- img
          |-- js
          |-- stylesheet.css
          |"
    },
 {
      instructions: "\nNow we're rolling! Lets remove our img directory and add a ruby directory using the 'rm -rf' command\n\n",
      success: "SUCCESS! You removed img and created a ruby directory",
      fail: "IncorrectInputError: use the 'rm -rf img && mkdir ruby' command",
      level: 12,
      answer: "rm -rf img && mkdir ruby",
      console_text: "",
      ascii: "
      desktop
      .
      |-- $ project
          .
          |-- main.html
          |-- css
          |    |-- stylesheet.css 
          |
          |-- img
          |-- js
          |"
    },
 {
      instructions: "\nLets move into our ruby directory using the 'cd ruby' command",
      success: "SUCCESS! You have moved into the ruby folder",
      fail: "IncorrectInputError: use the 'cd ruby' command",
      level: 13,
      answer: "cd ruby",
      console_text: "",
      ascii: "
      desktop
      .
      |-- $ project
          .
          |-- main.html
          |-- ruby
          |-- css
          |-- js
          |"
    },
 {
      instructions: "\nWe want to create one more file in this folder.  Let's use our 'touch filename' command one more time\n\nGo ahead and try it out!",
      success: "SUCCESS! You have created a 'ruby.rb' file",
      fail: "IncorrectInputError: use the 'touch ruby.rb' command",
      level: 14,
      answer: "touch ruby.rb",
      console_text: "",
      ascii: "
      desktop
      .
      |-- project
          .
          |-- main.html
          |-- $ ruby
          |-- css
          |-- js
          |"
    },
    {
      instructions: "\nWe can step back out of the 'ruby' folder and into the parent directory by using the 'cd ..' command",
      success: "SUCCESS! You have moved back to project folder",
      fail: "IncorrectInputError: use the 'cd ..' command",
      level: 15,
      answer: "cd ..",
      console_text: "",
      ascii: "
      desktop
      .
      |-- project
          .
          |-- main.html
          |-- $ ruby
          |   |-- ruby.rb
          |
          |-- css
          |-- js
          |"
    },
    {
      instructions: "Good Job! Not only can we move files, we can rename files using the 'mv filename newname' command\n\n",
      success: "SUCCESS! You renamed the file",
      fail: "IncorrectInputError: use the 'mv main.html index.html' command",
      level: 16,
      answer: "mv main.html index.html",
      console_text: "",
      ascii: "
      desktop
      .
      |-- $ project
          .
          |-- main.html
          |-- ruby
          |-- css
          |-- js
          |"
    },
      {
      instructions: "Amazing job! You now have the ability to perform the basic UNIX commands it takes in order to make and find any directory on your computer!\n\nThere's no excuse to ever make a folder by manually clicking the desktop ever again!\n\n Type 'next' into the console.",
      success: "SUCCESS!",
      fail: "IncorrectInputError: use the 'next' command",
      level: 17,
      answer: "next",
      console_text: "",
      ascii: "
      desktop
      .
      |-- $ project
          .
          |-- index.html
          |-- ruby
          |-- css
          |-- js
          |"
    },

  ].each do |challenge_hash|

  Challenge.where(:instructions => challenge_hash[:instructions]).first_or_create { |challenge| 
    challenge.update_attributes(challenge_hash)
  }

end