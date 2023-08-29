include ./config.mk

BERTHAWLIB = bertha_wrapper.so

OBJ = \
      funfm.o \
      gfinit.o \
      c_wrapper.o \
      bertha_wrapper.o

all : $(BERTHAWLIB) testb

$(BERTHAWLIB): $(OBJ)
	$(FC) -shared $(LINKFLAGS) $(OBJ) -o $(BERTHAWLIB) $(LIBS)

testb: $(BERTHAWLIB) main.o
	$(FC) -shared $(LINKFLAGS) main.o -o $@ $(BERTHAWLIB)

clean:
	rm -f *.o *.mod *__genmod.f90 $(BERTHAWLIB) testb
