include ./config.mk

BERTHAWLIB = bertha_wrapper.so

OBJ = \
      c_wrapper.o \
      bertha_wrapper.o

all : $(BERTHAWLIB)

$(BERTHAWLIB): $(OBJ)
	$(FC) -shared $(LINKFLAGS) $(OBJ) -o $(BERTHAWLIB) $(LIBS)
	cp $(BERTHAWLIB) ../lib

clean:
	rm -f *.o *.mod *__genmod.f90 $(BERTHAWLIB) 
