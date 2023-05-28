FC = gfortran
FFLAGS = -Wall -Wextra -Wimplicit-interface -Wno-surprising -fPIC -fmax-errors=10 -g -fcheck=all -fbacktrace

OBJ = utility.o subs.o driver.o

driver.exe: $(OBJ)
	$(FC) -o $@ $(OBJ) $(FFLAGS)

%.o: %.f90
	$(FC) -c $< $(FFLAGS)

.PHONY: clean

clean:
	rm -f driver.exe *.o *.mod *~
