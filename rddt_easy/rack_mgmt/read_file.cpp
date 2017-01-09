/*
* @Author: levyjm
* @Date:   2016-12-17 09:54:24
* @Last Modified by:   levyjm
* @Last Modified time: 2016-12-17 17:29:47
*/

#include <fstream>
#include <vector>
#include "boost/assign/std/vector.hpp"
#include <iostream>


using namespace std;

vector<string> stringArray;


void test(int* pointer) {
	cout << pointer << endl;
	cout << *pointer << endl;
	cout << &pointer << endl;
}
 
int main(){

	int* intPointer;

	*intPointer = 12;

	test(intPointer);
    return 0;
}