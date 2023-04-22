# Operating_Systems_Ex2

How to use the project:

First step is to run all the project using Makefile.
To use the Makefile you should enter the command: make


Usage by parts (what commands to run in terminal):


## Part A - 

### Tool 1 - "cmp": 
- ./cmp <file_1> <file_2>
- ./cmp <file_1> <file_2> -v
- ./cmp <file_1> <file_2> -i
- ./cmp <file_1> <file_2> -v -i
- ./cmp <file_1> <file_2> -i -v

> (Example command: ./cmp text1.txt text2.txt) 

### Tool 2 - "copy":
- ./copy <source_file> <destination_file>
- ./copy <source_file> <destination_file> -v
- ./copy <source_file> <destination_file> -f
- ./copy <source_file> <destination_file> -v -f
- ./copy <source_file> <destination_file> -f -v

> (Example command: ./copy text1.txt text2.txt) 


## Part B -

### Tool 1 - "encode":
- ./encode <codec_> <message_>

> (Example command: ./encode codecA aaaBBB) 


### Tool 2 - "decode":
- ./decode <codec_> <message_>

> (Example command: ./decode codecB EEEddd) 


## Part C - (Tool - "stshell")

To enter the stshell program, enter the command: ./stshell
Once you in the program you can try to use this commands:

- <terminal_command>
- <terminal_command> > <destination_file>
- <terminal_command> >> <destination_file>
- <terminal_command> | <terminal_command>
- <terminal_command> | <terminal_command> > <destination_file>
- <terminal_command> | <terminal_command> >> <destination_file>
- <terminal_command> | <terminal_command> | <terminal_command> 
- <terminal_command> | <terminal_command> | <terminal_command> > <destination_file> 
- <terminal_command> | <terminal_command> | <terminal_command> >> <destination_file> 

> (Example: ls -l | grep .txt | wc > textfile.txt)

To quit (exit) from the stshell program, enter the command: exit

*Notice: "CTRL + C" may not exit the stshell, it only a stop running tool*
> (Example: enter the command: sleep 5
and after 2 second press "CTRL + C")
