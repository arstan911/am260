OBJ =  advect.o setup.o
MODS = setup.mod

advect.exe : $(MODS) $(OBJ)
	gfortran $(OBJ) -o advect.exe

%.o: %.f90
	gfortran -c -fdefault-real-8 -fdefault-double-8  $<

%.mod: %.f90
	gfortran -c -fdefault-real-8 -fdefault-double-8  $<

clean:
	rm -f $(OBJECTS) $(MODS) advect.exe
