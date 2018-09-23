#include <stdlib.h>
#include <stdio.h>
#include <iostream>

#include "hello.h"

using namespace std;

int main(int argc, char const *argv[])
{
    auto hello_str = get_hello();
    cout << hello_str << endl;
    return 0;
}