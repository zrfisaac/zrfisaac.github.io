# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io

# [ devcpp ]
#include <iostream>
#include <stdexcept>

int main(int argc, char** argv) {
    try {
        std::cout << "Hello, World!" << std::endl;
    } catch (const std::exception& e) {
        std::cout << e.what() << std::endl;
        throw;
    }
    std::cin.get();
    return 0;
}

