import os
import sys
import time
import stat

def printFile(fn):
    arr = os.listdir(fn)
    for i in arr:
        print(i)

def printFileLong(fn):
    arr = os.listdir(fn)
    print("permission last modification\tsize\t name")
    print("----------------------------------------------------------------------")
    for i in arr:
        path = os.path.join(fn, i)
        print(stat.filemode(os.stat(path).st_mode), time.strftime("%Y-%b-%d %H:%M:%S", time.gmtime(os.path.getmtime(path))), os.path.getsize(path), "\t", i)

def pathExist(fn):
    if os.path.exists(fn):
        printFile(fn)
    else:
        print("Path don't exist")

def pathExistLong(fn):
    if os.path.exists(fn):
        printFileLong(fn)
    else:
        print("Path don't exist")

if len(sys.argv) == 1:
    fn=os.getcwd()
    printFile(fn)
elif len(sys.argv) == 2:
    if sys.argv[1] == "-l":
        fn=os.getcwd()
        printFileLong(fn)
    else:
        fn = sys.argv[1]
        pathExist(fn)
elif len(sys.argv) == 3:
    if sys.argv[1] == "-l":
        fn = sys.argv[2]
        pathExistLong(fn)
    elif sys.argv[2] == "-l":
        fn = sys.argv[1]
        pathExistLong(fn)
elif len(sys.argv) >= 4:
    print("Too many arguments")