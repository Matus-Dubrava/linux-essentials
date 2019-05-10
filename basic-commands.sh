# list files in a folder
ls

# show hidden files as well
ls -a

# long list
ls -l

# sort by larges file
ls -Sl 
ls -l -S

# sort in reverse
ls -lSr

# list contents of a folder and its subfolders
ls -R <foldername>

# sort by time modified
ls -lt 

#-----------------------------------------------------

# list environment variables
env

# show path variable
echo $PATH

# show username of logged in user
whoami
# or
echo $LOGNAME

# substitute user, type 'exit' to return
su <username>

# show top running processes 
top

# show name of our system 
uname
uname -r # shows kernel version
uname -v # show when was the kernel build
uname -p # show processor info
uname -o # show full name of the system
uname -a # show all of the above

# get current working directory
pwd
echo $PWD

# return to previous directory
cd -

# go to home directory
cd ~

# history of the commands is stored within hidden file in home directory
cd ~
cat .bash_history

# show number of entries that history file is set to store
echo $HISTFILESIZE

# show how history file is configured
echo $HISTCONTROL

# print contents of history 
history

# run specific command from history
!<number>

#-------------------------------------------------------------------
# shell configuration
#-------------------------------------------------------------------

# first file that is called is 
cat /etc/profile

# next, first file out of these is called, rest is ignored 
~/.bash_profile 
~/.bash_login
~/.profile
~/.bashrc
/etc/bashrc
 
# when the user logs out, logout file is called
~/.bash_logout

#-------------------------------------------------------------------
# environment variables
#-------------------------------------------------------------------

# print variable
echo $VARNAME

# list all environment variables
env

# create new env variable, this will be removed when bash is restarted (local variable)
TEST="some value" # echo $TEST

# export variable (so that it will not be removed)
export TEST

# update PATH variable (append it with new entry)
PATH=$PATH:/opt
export PATH

#-------------------------------------------------------------------
# globbing
#-------------------------------------------------------------------

ls *.txt
ls test*
ls ?.txt # ? is replaced with a single character
ls test?.txt
ls [abc].txt # is replaced with a single character from the list
ls [^abc].txt # is replaced with a single character that is not on the list

ls [Ww]eather[Rr]eport199[0-9]?2017*

#--------------------------------------------------------------------
# quoting
#--------------------------------------------------------------------

# double quotes - contains string and variables or commands within them get evaluated
echo "currently logged in as $LOGNAME"

# single quotes - contains string, variables or commands are not evaluated
echo 'currently logged in as $LOGNAME'

# backslash removes meaning of a single special character (escape it)
echo "currently logged in as \$LOGNAME"

#--------------------------------------------------------------------
# searching for files
#--------------------------------------------------------------------

# searches local database of files and folders looking for item that matches 
# the criteria
locate <string>

# searches the filesystem for files that match the search criteria
# provide folder where the search should start, if not then the search
# starts in the current working directory
find /home/user/.config -name '*.xml'

# locate binary, source and/or manual pages for a command
whereis <command> # ex. whereis cd

#-------------------------------------------------------------------
# man
#-------------------------------------------------------------------

# show man page for a particular command
man <command> 

# show man page with specified section 
man <section-number> command

# show sections that apply for a command
whatis <command>

# search for particular keyword across all man pages 
apropos <keyword>
# or
man -k <keyword>

# find a keyword within an opened manpage
/<keyword>

# info is alternative to man
info <command>

# common local document directories
/usr/doc/packagename
/usr/share/doc/packagename
/usr/share/packages/packagename

#-------------------------------------------------------------------
# filesystem
#-------------------------------------------------------------------

# Directory structure
# - inverted tree with single root
# - case sensitive
# - paths are delimited by a /
# - any folder or file whose name is preceded with a . (dot) are hidden from normal view
# - a single . (dot) in a directory refers to the current directory
# - a double .. (dot) refers to the parent directory of any particular directory

# create folder
mkdir <dir-name1> <dir-name2> ... <dir-nameN>

# create new parent directory together with subdirectory
mkdir -p <parent-dir>/<sub-dir>

# verify structure with recursive ls
ls -R <parent-dir>

# remove directory (works only with empty folders)
rmdir <dir-name>

# copy files and folders
cp <source> <destination>

# move files and folders (also rename files)
mv <source> <destination>

# remove file
rm <file>

# remove directory with all its contents (recursively)
rm -r <dir>

#-------------------------------------------------------------------
# compression
#-------------------------------------------------------------------

# tar
# -c create new archive
# -z pass the archive through gzip compression
# -j pass the archive through bzip2 compression
# -f file name of archive to create
# -x extract an archive
# -v verbose output
# -t list archive contents

# create simple archive  (without compression)
tar -cf <filename>.tar <source>

# list archive contents
tar -tf <filename>.tar

# extract archive (without compression) 
tar -xf <filename>.tar

# archive and compress (order of flgs matter)
tar -czf <filename>.tar.gz <source>
tar -cjf <filename>.tar.bg2 <source>

# extract compressed archive
tar -xzf <filename>.tar.gz <detination> # use -xvzf for verbose 
tar -xjf <filename>.tar.bz2 <destination>

# using zip
zip -r <filename>.zip <source>

# unzip 
unzip <filename>.zip

# gzip
gzip -r <filename>.gz <source>
gunzip <filename>.gz

# bzip2
bzip2 -r <filename>.bz2 <source>
bunzip2 <filename>.bz2

#-------------------------------------------------------------------
# view text
#-------------------------------------------------------------------

less <filename> # load single page into memory at a time
# /<keyword>  - search for keyword

# show first 10 line of a file
head <filename> 
# show N first lines
head -n 20 <filename>

# show end of a file (same as head command but in reverse)
tail <filename>
tail -n <number> <filename>

# show end of a file as it is being created 
tail -f <filename>

# redirect standard output to a file 
>

# redirect and append standard outputto a file
>> 

# remove test from file and print specified fields to screen
# cut
# -d = specifies delimiter to use
# -f = specifies which field to print

# split on ' ' (space) and pick fields from the sixth position
cut -d" " -f 6- <filename> 

# sort file alphabetically
sort <filename>

# get word count 
# wc
# -l = number of lines
# -w = number of words
wc -wl

# search for pattern in text
grep <pattern> <filename> 
# -i = case insensitive search
grep -i <pattern> <filename> 

# we can use | (pipe) to redirect the outout to some other command
grep -i <pattern> <filename> | less

# count the number of occurances of the searched word
grep -io <pattern> <filename> | wc -w

# use regular expressions as a pattern
#  find all lines that begin with the word 'republic'
grep -i '^republic' <filename>
#  find all lines that end with the word 
grep -i 'republic$' <filename>
#  find all lines that begin with a, A, b, or B
grep -i '^[aAbB]' <filename> 
#  negate the previous command 
gpep -i '^[^aAbB]' <filename>
# . (dot) represents a single unknown character
#  find all lines that have 'h' as a second character
grep '^.[h]' <filename> 
# * (star) match zero or more ofthe preceding characters or expressions
grep 'www*' <filename>

#-------------------------------------------------------------------
# hardware
#-------------------------------------------------------------------

# processor
cat /proc/cpuinfo

# ram
free 
free -g # show output in GB
free -m # show output in MB

# motherboard, BIOS, processor, and RAM
dmidecode

# hard disk
# located under
/dev/sda # /sdb, /sdc ...
# partitions are denoted with numbers
/dev/sda1 # /sda2, /sda3 ...
# view all block devices attached to your system
lsblk
# view free space on a disk
df
df -h # show output in human readable format