import ctypes
import os.path

class pybertha:
    
    def __init__(self, sopath="./bertha_wrapper.so"):

        soname = sopath
        if (not os.path.isfile(soname) ):
            raise Error("SO %s  does not exist" % soname)

        self.__bertha = ctypes.cdll.LoadLibrary(soname)
        
    def run(self):

        self.__bertha.mainrun ()
