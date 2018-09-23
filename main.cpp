#include <stdlib.h>
#include <stdio.h>
#include <iostream>

#include "hello.h"

using namespace std;

int main(int argc, char const *argv[])
{
    cout << get_hello().c_str();
    return 0;
}