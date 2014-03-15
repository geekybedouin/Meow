===================
 About the Project
===================

 A free-software minimized educational IDE developed by 'Umar A.Abu Bakr - An-Najah National University | Computer Science student - 2014. Offers a graphical UI implemented in JAVA programming language based on the "Khwarizmi Baby C Compiler" - (kbcc) which is implemented in "x86/GAS Syntax Assembly". The compiler aims to transfer c code into a target machine code/executable program, with a report showing the details of each compiler phase. compatible with GNU/Linux x86 machines.

=================
  System Specs
=================
*JDK (Java Development Kit) 7.51 or higher
*GNU/linux x86 machine
*gcc, g++ and build-utils installed

=================
   How to run 
=================
* copy lexical executable to /bin
   -could be done in terminal by typing: sudo cp lexical /bin
* grant execution permessions for the lexical analyzer
    -could be done in terminal by typing: sudo chmod a+x /bin/lexical
* copy favicon.png to /bin
   -could be done in terminal by typing: sudo cp favicon.png /bin


**if you want to run the Bak GUI
  -in a bash, ksh or csh: /absolute/path/to/java -jar /absolute/path/to/Bak.Jar

**if you want to run the lexical analyser only
  -in a bash, ksh: lexical [par1] [par2] [par3]
      -[par1]: absolute/path/to/source.cpp
      -[par2]: absolute/path/to/temp.c **VERY IMPORTANT** --> this is used as the output of the preprocesser which eleminates comments
      -[par3]: absolute/path/to/symbol-table.cpp

====================
 Source Compilation
====================

***LEXICAL

  the lexical analyser is written in two languages [c & x86/gas Assembly] and then generated all to a utilized gas assembly code through g++, if you want to assemble the code you can type [as /absolute/path/to/lexical.s] in  terminal

***Bak IDE

  use netbeans to compile the code

======================
 Project Contribution
======================


 the bak-IDE is listed under the GNU GPL v3 license which make it tottaly free-software, if you really want to add to the project be a contributer to our project on github: https://github.com/geekybedouin/Bak-IDE
