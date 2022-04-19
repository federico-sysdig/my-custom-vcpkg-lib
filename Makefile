# Makefile

CXXFLAGS = -Wall -fpic -std=c++11

all: my-custom-vcpkg-tool libmy-custom-vcpkg-lib.so

# ----

file1.o: file1.cpp my-custom-vcpkg-lib.h
	$(CXX) -c $(CXXFLAGS) $<

file2.o: file2.cpp my-custom-vcpkg-lib.h
	$(CXX) -c $(CXXFLAGS) $<

libmy-custom-vcpkg-lib.so: file1.o file2.o
	$(CXX) -shared -o $@ $^
	#$(CXX) -shared -Wl,-soname,lib<...>.so.1 -o $@ $^
	#ln -s lib<...>.so.1.5.0 lib<...>.so.1
	#ln -s lib<...>.so.1.5.0 lib<...>.so
# ----

my-custom-vcpkg-tool.o: my-custom-vcpkg-tool.cpp
	$(CXX) $(CXXFLAGS) -c $< 

my-custom-vcpkg-tool: my-custom-vcpkg-tool.o
	$(CXX) -o $@ $^

# ----

clean:
	$(RM) *.o libmy-custom-vcpkg-lib.so my-custom-vcpkg-tool
