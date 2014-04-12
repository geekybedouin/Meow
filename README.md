===================
 About the Project
===================

 Meow "Minimized Educational Open Windowing" is free-software minimized educational IDE developed by 'Umar A.Abu Bakr - An-Najah National University | Computer Science Department - 2014. Offers a graphical UI implemented in JAVA programming language based on the "Khwarizmi Baby C Compiler" - (kbcc) which is a single-pass compiler implemented in "x86/GAS Syntax Assembly" and "C language".The Kbcc is also a part of the Meow project and is also a free-software" The compiler aims to transfer c code into a target machine code/executable program, with a report showing the details of each compiler phase. compatible with GNU/Linux x86 machines.

=================
 Project License
=================

    Meow is a minimized IDE and a single pass compiler
    Copyright (C) 2014  'Umar A.Abu Bakr

    Meow is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, version 3 of the License.

    Meow is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Publicv3 License for more details.
    
    For the GNU GPLv3 liscese alongside Tterms and conditions:
    http://www.gnu.org/licenses/gpl.txt

==================
About the Compiler
==================

Meow project uses Kbcc, which is a part of the whole project. The Khwarizmi Baby C Compiler is a single-pass baby compiler based on a recursive descent parser.The Meow uses the "Educational Release" of the compiler, which doesn't do neither type-checking nor memory manipulation and allocation, because it's only set to let students demonstrate how a compiler works.


  System Specs
=================
* GNU/linux x86 machine
* gcc, g++ and build-utils installed

===================
  How to Install 
===================
* In terminal, grant executing permissions to the configuration file (config) [sudo chmod a+x /absolute/path/to/config]
* Run the config file in terminal [./absolute/path/to/config] 

=================
   How to run 
=================
* if you want to run the meow GUI
  -in a bash, ksh or csh: simply type "meow"

* if you want to run the kbcc only
  -in a bash, ksh: [lexical /par1/ /par2/ /par3/]
      -[par1]: absolute/path/to/source.cpp
      -[par2]: absolute/path/to/temp.c **VERY IMPORTANT** --> this is used as the output of the preprocesser which eleminates comments
      -[par3]: absolute/path/to/symbol-table.cpp

====================
 Source Compilation
====================

* LEXICAL

  the lexical analyser is written in two languages - c & x86/gas Assembly - and then generated all to a utilized gas assembly code through g++, if you want to assemble the code you can type -  [as /absolute/path/to/lexical.s] - in  terminal

* meow IDE

  use any IDE to compile the code

======================
 Project Contribution
======================


 the meow-IDE is listed under the GNU GPLv3 license which make it tottaly free-software, if you really want to add to the project be a contributer to our project on github: https://github.com/geekybedouin/Meow

