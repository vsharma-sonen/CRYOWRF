FC = gfortran # gfortran
CXX = g++

COMPNAME := $(shell hostname -s | sed 's/[0-9]//g' )

ifeq ($(COMPNAME),cryospc)
   $(info UNAME is $(COMPNAME))
   FCFLAGS = -O3 -g -fbacktrace
   CCFLAGS = -O3 -g 
endif

ifeq ($(COMPNAME),daint)
   FC = ftn
   CXX = CC
   FCFLAGS = -O3 -g -traceback
   CCFLAGS = -O3 -g -traceback
endif

all: libtrial.a

libtrial.so : foo_mod.o funcs.o foo_capi.o Foo.o  
	gcc -shared $^ -o $@

libtrial.a : foo_mod.o funcs.o foo_capi.o Foo.o  
	ar rcs $@ $^

%.o : %.f90
	${FC} ${FCFLAGS} -c $^ -o $@ -I../snow_libs/include

%.o : %.cpp
	${CXX} ${CCFLAGS} -c $< -o $@ -I../snow_libs/include

.PHONY : clean

clean :
	${RM} -rf *.o *.mod test.x *.a *.so
