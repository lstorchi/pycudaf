import argparse
import sys

import os.path

from dataclasses import dataclass

@dataclass
class pyberthaoption:
    wrapperso: str = "./bertha_wrapper.so"

##########################################################################################

def runspbertha (pberthaopt):

    sys.path.insert(0, pberthaopt.berthamodpath)
    import berthamod

    bertha = berthamod.pybertha(pberthaopt.wrapperso)
    
    print(bertha.get_thresh())
    
    bertha.run()

    print(bertha.get_thresh())


##########################################################################################

if __name__ == "__main__":

    parser = argparse.ArgumentParser()
    parser.add_argument("--wrapperso", help="set wrapper SO (default = ./bertha_wrapper.so)", 
            required=False, type=str, default="./bertha_wrapper.so")
    parser.add_argument("--modpaths", help="set berthamod path (default = ./)", 
            required=False, type=str, default="./")
    args = parser.parse_args()

    for path in args.modpaths.split(";"):
        sys.path.append(path)

    modpaths = os.environ.get('PYBERTHA_MOD_PATH')

    if modpaths is not None :
        for path in modpaths.split(";"):
            sys.path.append(path)

    pberthaopt = pyberthaoption

    pberthaopt.wrapperso = args.wrapperso
    pberthaopt.berthamodpath = args.modpaths

    runspbertha (pberthaopt)
