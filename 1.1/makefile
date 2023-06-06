FC = gfortran
FFLAGS = -Wall -Wextra -Wimplicit-interface -Wno-surprising -fPIC -fmax-errors=10 -g -fcheck=all -fbacktrace

OBJ = utility.o read_initFile_module.o setup_module.o grid_init.o advect.o

advect.exe: $(OBJ)
	$(FC) -o $@ $(OBJ) $(FFLAGS)

%.o: %.f90
	$(FC) -c $< $(FFLAGS)

.PHONY: clean

clean:
	rm -f advect.exe *.o *.mod *~
