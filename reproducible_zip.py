import os, sys, mmap
from zipfile import ZipFile, ZipInfo

with ZipFile(sys.argv[1], "w") as z:
    for filename in sys.argv[2:]:
        with open(filename, "r+b") as f:
            mm = mmap.mmap(f.fileno(), 0)
            try:
                z.writestr(ZipInfo(os.path.basename(filename), (1980, 1, 1, 0, 0, 0)), mm)
            finally:
                mm.close()
