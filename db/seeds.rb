challenges = [
    {
      instructions: "Welcome to Command Academy!\nWe'll teach you UNIX commands to create a front-end directory on your desktop\n\nType PWD into the console to see our 'Present Working Directory'\n\nGo ahead, try it out!",
      success: "SUCCESS! Now you know where you are!",
      fail: "IncorrectInputError: You should try the 'pwd' command",
      level: 0,
      answer: "pwd",
      console_text: "/Users/owner/desktop"
    },
    {
      instructions: "Let's create a main project folder.  When using 'mkdir folder_name' a new directory will be created in our 'pwd'.\n\nGive it a try using 'project' as your folder name!",
      success: "SUCCESS! Your main project Folder has now been created.",
      fail: "IncorrectInputError: You should try 'mkdir project'",
      level: 1,
      answer: "mkdir project",
      console_text: ""
    },
    {
      instructions: "Now we need to Change Directory into our 'project' folder.\n\n  Using the command 'cd folder_name' we can step into that directory",
      success: "SUCCESS! Your 'pwd' is now your project folder",
      fail: "IncorrectInputError: You should try 'cd project'",
      level: 2,
      answer: "cd project",
      console_text: "/Users/owner/desktop/project"
    }, 
    {
      instructions: "Creating a new file is as easy as 'touch'.  In your 'pwd', a new file will be created when using the command 'touch file_name'.\n\nGive it a try using 'main.html' as your file name",
      success: "SUCCESS! You've made a 'main.html' file",
      fail: "IncorrectInputError: You should try 'touch main.html'",
      level: 3,
      answer: "touch main.html",
      console_text: ""
    },
     {
      instructions: "We can use 'ls' to see a list of items in your current directroy\n\n Go ahead and type 'ls' into the terminal",
      success: "SUCCESS! You've used 'ls' to see a list of items in your current directory",
      fail: "IncorrectInputError: You should try 'ls'",
      level: 4,
      answer: "ls",
      console_text: "main.html"
    },
      {
      instructions: "Awesome, lets 'Change Directories' for a moment and back to the desktop\n\n Type 'cd ..' to get back into the desktop",
      success: "SUCCESS! You're now currently on Desktop ",
      fail: "IncorrectInputError: You should try 'cd ..'",
      level: 5,
      answer: "cd ..",
      console_text: "/Users/owner/desktop"
    },
     {
      instructions: "Great job!  Now we're going to create multiple directories by chaining two '&&' together on one line. && == 'and' \n\nTry it out, type 'mkdir css && mkdir js && mkdir img' in the console",
      success: "SUCCESS! You've made three folders in one step",
      fail: "IncorrectInputError: You should try 'mkdir css && mkdir js && mkdir img'",
      level: 6,
      answer: "mkdir css && mkdir js && mkdir img",
      console_text: ""
    },
      {
      instructions: "Alright, now take a look at the folders we've created by typing 'ls' into the console\n\n",
      success: "SUCCESS! You used the 'ls' command",
      fail: "IncorrectInputError: Try typing 'ls' into the console",
      level: 7,
      answer: "ls",
      console_text: "main.html css js img"
    },
      {
      instructions: "So far, so good! We saw how powerful '&&' is in our commands, we can also use it to 'touch' files\n\n Type 'touch stylesheet.css && touch script.js && touch cat.jpg' into the console",
      success: "SUCCESS! You used the 'touch stylesheet.css && touch script.js && cat.jpg' command'",
      fail: "IncorrectInputError: Try the 'touch stylesheet.css && touch script.js && cat.jpg' command",
      level: 8,
      answer: "touch stylesheet.css && touch script.js && cat.jpg",
      console_text: ""
    },
      {
      instructions: "Nice! if you type 'ls' in the console you can see the files we've created are not where want them to be\n\n Type 'ls' into the console",
      success: "SUCCESS! you've used the 'ls' command",
      fail: "IncorrectInputError: try the 'ls' command",
      level: 9,
      answer: "ls",
      console_text: "main.html css js img stylesheet.css script.js cat.jpg"
    },
      {
      instructions: "Cool! Now we can move the files into their respective directories.\n\n mv cat.jpg img ",
      success: "SUCCESS! You moved cat.jpg into the img",
      fail: "IncorrectInputError: Try typing the 'mv cat.jpg img' command",
      level: 10,
      answer: "mv cat.jpg img",
      console_text: ""
    },
      {
      instructions: "Great job! You can see the syntax reads like this 'mv source destination'\n\n Type 'mv stylesheet.css css && mv script.js js' into the console",
      success: "SUCCESS! You moved the script.js & stylesheet.js into their homes",
      fail: "IncorrectInputError: use the'mv stylesheet.css css && mv script.js js' ",
      level: 11,
      answer: "mv stylesheet.css css && mv script.js js",
      console_text: ""
    },
      {
      instructions: "All set! We'll 'ls' one more time and the console shows us the contents of project directory\n\n Type 'ls' in the console",
      success: "SUCCESS! You used the 'ls' command",
      fail: "IncorrectInputError: type 'ls' in the console ",
      level: 12,
      answer: "ls",
      console_text: "main.html  css  js  img"
    },
      {
      instructions: "Now we're rolling! Lets remove our img directory and add a ruby directory using the 'rm' command\n\nType 'rm -rf img && mkdir ruby' in the console",
      success: "SUCCESS! You removed img and created a ruby directory",
      fail: "IncorrectInputError: use the 'rm -rf img && mkdir ruby' command  ",
      level: 13,
      answer: "rm -rf img && mkdir ruby",
      console_text: ""
    },
      {
      instructions: "Awesome!, lets change current directory to ruby and create a ruby file.\n\n Type 'cd ruby && touch ruby.rb' into the console",
      success: "SUCCESS! You did what we told ya!",
      fail: "IncorrectInputError: use the 'cd ruby && touch ruby.rb' command",
      level: 14,
      answer: "cd ruby && touch ruby.rb",
      console_text: ""
    },
      {
      instructions: "Good Job! Not only can we move files, we can rename files using the 'mv' command\n\n Type 'mv main.html index.html'",
      success: "SUCCESS! You renamed the file",
      fail: "IncorrectInputError: use the 'mv main.html index.html' command",
      level: 15,
      answer: "mv main.html index.html",
      console_text: ""
    },
      {
      instructions: "Almost there! We can can use the 'cat' command to display the contents of a file\n\n Type 'cat index.html' into the console",
      success: "SUCCESS! You showed the items contents!",
      fail: "IncorrectInputError: Use the 'cat index.html' command",
      level: 16,
      answer: "cat index.html",
      console_text: "<h1>Hello World<h1>"
    },

  ].each do |challenge_hash|

  Challenge.where(:instructions => challenge_hash[:instructions]).first_or_create { |challenge| 
    challenge.update_attributes(challenge_hash)
  }

end