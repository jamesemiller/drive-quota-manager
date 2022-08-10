"""
simple loop script to increase the size of a file to test that the
quota mechanism is working on the selected mount point
"""

import sys, os

MOUNT_PATH = "/mnt/USB"

f = open(MOUNT_PATH + "demofile.txt", "a")
for i in range(10000):
    try:
       
        f.write("Now the file has more content!")
    except OSError as error:
        if error.errno == 122:
            print(error) # quota limit reached error
            f.close()
            sys.exit(os.EX_CANTCREAT)
f.close()


