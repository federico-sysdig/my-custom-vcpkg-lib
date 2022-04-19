#include <iostream>
#include <string>

namespace my_custom_vcpkg_lib {

void println(std::string const& str)
{
  std::cout << str << '\n';
}

}
