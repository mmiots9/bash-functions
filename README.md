<h1 align="center">My bash functions</h1>

This folder contains different bash functions I've created so far. You can see the relative posts in my blog <a href="https://miotsdata.netlify.app/en/bash/mie_funzioni/" target=”_blank”>here</a>.  
If you have any suggestions, please don't exitate to contact me.

<h3>Installation</h3>
To install these functions, I strongly reccomend to download the entire folder and add this to your .bash_profile or .zshrc:

```
for file in ~/path-to-folder/*.sh  source $file done
```

<h3>cheat_short.sh</h3>
The aim of these functions is to write and search into cheatsheet files.
The function <i>addshort</i> let you insert the shortcode command and description, while the function <i>searchshort</i> allow you to search into these files. A demonstration is given <a href="https://miotsdata.netlify.app/en/bash/mie_funzioni/addshort_searchshort/" target=”_blank”>here</a>.
Remember to edit these functions to match your needs.

<h3>diary.sh</h3>
In these file, the two functions help you create a diary of the terminal commands, based on command history.
When you want to start recording your commands, just type <i>diarystart path/filename</i> on your console; and when you want to stop recording your commands, type <i>diaryend</i>. This will create a file with the name given in the diarystart command and in the given path.
You can use this file as a diary of the commands launched in the terminal for a data analysis ecc or use it to re-launch all commands, saving the file with .sh extension and sourcing it.

<h3>rename.sh</h3>
I created these functions to rename files and directory, in such a way as to have all them with the same structure:
<li>Word1_Word2 for directories</li>
<li>Word1Word2 for files</li>

The function to launch is <i>renameAll</i>, which rename all files and directories in the current directory (but not the subdirectories and subfiles), recognizing them as one or the other and applying the right structure (renameFile or renameDir).
You can see an example <a href="https://miotsdata.netlify.app/en/bash/mie_funzioni/diary/" target=”_blank”>here</a>.

<h3>git-info.sh</h3>
In this file, the main function is <i>repoinfo</i>, while <i>topush</i> is still in progress, but it should work fine.
Repoinfo function allow you to have a feedback about your github repositories. In fact, editing the file and adding the info required, this function can be run in the terminal and it returns a list of all your github repositories (even the private ones) with some infos:
<li><i>Reponame</i> pushed by <i>commit_author</i> on <i>commit_date_time</i>: <i>commit_message</i></li>

