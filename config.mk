# redo

FC = nvfortran
CC = nvcc

LINKFLAGS = 
CFLAGS =
FFLAGS = 
EXTRA = 

# for Quadro P2000 -gpu=cc61,cuda12.1 
# for marconi -gpu=cc70,cuda11.8 
FFLAGS += -acc=gpu -Minfo=accel -cuda -cudalib=cublas,cusolver  
FFLAGS += -r8 -Minform=warn -Mextend -O3 -cudalib=cublas $(INCLUDE) 
FFLAGS += -fopenmp 
#FFLAGS += -fpic -gpu=nordc
FFLAGS += -fpic 
FFLAGS += -DUSECUDANV $(EXTRA)

CFLAGS += -D_FILE_OFFSET_BITS=64 -O3  
CFLAGS += --compiler-options '-fopenmp'
CFLAGS += --compiler-options '-fPIC'

LINKFLAGS += -acc=gpu -Minfo=accel -cuda -cudalib=cublas,cusolver  
LINKFLAGS += -fopenmp

MAKE = make

.SUFFIXES:

%.o:	%.c
	$(CC) $(CFLAGS) $(COPT) $(INCLUDE) -o $@ -c $< 

%.o:	%.F
	$(FC) $(FFLAGS) $(FOPT) $(INCLUDE) -o $@ -c $< 

%.o:	%.f
	$(FC) $(FFLAGS) $(FOPT) $(INCLUDE) -o $@ -c $< 

%.o:	%.f90
	$(FC) $(FFLAGS) $(FOPT) $(INCLUDE) -o $@ -c $< 

%.o:	%.F90
	$(FC) $(FFLAGS) $(FOPT) $(INCLUDE) -o $@ -c $< 

%.o : %.f90
	$(FC) $(FBASICF) -o $@ -c $<
