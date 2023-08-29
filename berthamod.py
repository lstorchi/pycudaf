import ctypes
import os.path

class pybertha:
    
    def __init__(self, sopath="./bertha_wrapper.so"):

        soname = sopath
        if (not os.path.isfile(soname) ):
            raise Error("SO %s  does not exist" % soname)

        self.__bertha = ctypes.cdll.LoadLibrary(soname)

    def get_thresh (self):

        self.__bertha.get_thresh.restype = ctypes.c_double
 
        return self.__bertha.get_thresh()

        
    def run(self):

        self.__bertha.mainrun ()
