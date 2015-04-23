challenges = [
    {
      instructions: "Welcome to Command Academy!\nWe’re about to teach you how to use your terminal to navigate through your computer and create project directories with lightning speed.\n\nTo begin, why don’t we check out what present working directory we’re currently in? We can do this by typing ‘pwd’ into the console.\n\nGo ahead, try it out!",
      success: "SUCCESS! Now you know where you are!",
      fail: "IncorrectInputError: You should try the 'pwd' command",
      level: 0,
      answer: "pwd",
      console_text: "/Users/owner/desktop"
    },
    {
      instructions: "Let's create a main project folder.  When using 'mkdir folder_name' a new directory will be created in our 'pwd'.\n\nGive it a try using 'project' as your folder name!",
      success: "SUCCESS! Your main project Folder has now been created.",
      fail: "IncorrectInputError: You should try 'mkdir Project'",
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
      instructions: "Creating a new file is as easy as 'touch'.  In your 'pwd' a new file will be created when using the command 'touch file_name'.\n\nGive it a try using 'main.html' as your file name",
      success: "SUCCESS! You've made a 'main.html' file",
      fail: "IncorrectInputError: You should try 'touch main.html'",
      level: 3,
      answer: "touch main.html",
      console_text: ""
    },
    {
      instructions: "Alright, add another folder inside the 'pwd' and name it style.\n\nYou already know how to do this using the 'mkdir folder_name' command",
      success: "SUCCESS! You've made a 'style' folder",
      fail: "IncorrectInputError: You should try 'mkdir style'",
      level: 4,
      answer: "mkdir style",
      console_text: ""
    },
     {
      instructions: "Great job but we named our folder wrong and want to get rid of it.  Remove a directory by using the 'rmdir folder_name' command.\n\nGive it a try with 'rmdir folder_name'! ",
      success: "SUCCESS! You've removed your 'style' folder",
      fail: "IncorrectInputError: You should try 'rmdir style'",
      level: 5,
      answer: "rmdir style",
      console_text: ""
    },
     {
      instructions: "Now we know the correct name of the folder.  Two more folders are needed and lucky we can make all the folders in one step using the '&&' command in between our 'mkdir folder_name' commands.\n\nTry it out using 'mkdir css && mkdir js && mkdir ruby'",
      success: "SUCCESS! You've made three folders in one step",
      fail: "IncorrectInputError: You should try 'mkdir css && mkdir js && mkdir ruby'",
      level: 5,
      answer: "mkdir css && mkdir js && mkdir ruby",
      console_text: ""
    },
  ].each do |challenge_hash|

  Challenge.where(:instructions => challenge_hash[:instructions]).first_or_create { |challenge| 
    challenge.update_attributes(challenge_hash)
  }

end