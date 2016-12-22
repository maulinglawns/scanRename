# scanRename
Remove 3-digit number automatically added by scanner software

<h2>Some examples</h2>
Show help:
<pre>./scanRename.sh -h
Usage: ./scanRename.sh [-h] [path]
If no [path] is passed as argument. $HOME/Desktop/scans will be used

Summary:
This program deletes the autumatically added numbers that are added to
the filenames by Epson scanner software.

Examples:
./scanRename.sh /home/images/scandir
Will use the directory /home/images/scandir to process images
./scanRename.sh -h
Show this help</pre>

Errors:
<pre>./scanRename.sh foo
The directory foo does not exist or is not readable.

./scanRename.sh foo bar
Too many arguments. See ./scanRename.sh -h for usage

./scanRename.sh -i
Unknown option -i. See ./scanRename.sh -h for usage.</pre>

---

Now some examples of correct usage:
<pre>./scanRename.sh $HOME/Desktop/myImages
self portrait471.jpg -> self portrait.jpg
1 image(s) processed.</pre>

**Before and after...**<br>
Before:
<pre>ls $HOME/Desktop/scans
boatride in Jamaica001.png my image112.jpg
bröllop123.jpg             vacation003.jpg
highres portrait009.tif

./scanRename.sh 
boatride in Jamaica001.png -> boatride in Jamaica.png
bröllop123.jpg -> bröllop.jpg
highres portrait009.tif -> highres portrait.tif
my image112.jpg -> my image.jpg
vacation003.jpg -> vacation.jpg
5 image(s) processed.</pre>

After:
<pre>ls $HOME/Desktop/scans
boatride in Jamaica.png highres portrait.tif    vacation.jpg
bröllop.jpg             my image.jpg</pre>
