/*
* @Author: levyjm
* @Date:   2016-12-19 20:45:29
* @Last Modified by:   levyjm
* @Last Modified time: 2016-12-19 22:51:52
*/

#include <iostream>
#include <sstream>
#include <deque>

using namespace std;

std::deque<string> mainBuffer;

void repeat(string gift) 
{
	mainBuffer.push_front(gift);
	for (int j=0; j < mainBuffer.size(); j++) { 
		if (j != 0) { 
			mainBuffer.pop_back();
			mainBuffer.push_back("and a Partridge in a Pear Tree\n");
		}
		cout << mainBuffer[j]; 
	}
}

int main(){

	string whatDay[] = {"first", "second", "third", "fourth", "fifth", "sixth",
							"seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth"};
	string howMany[] = {"a ", "two ", "three ", "four ", "five ", "six ", "seven ", 
						"eight ", "nine ", "ten ", "eleven ", "twelve "};
	string gifts[] = {"Partridge in a Pear Tree", "Turtle Doves", "French Hens", "Calling Birds", "Golden Rings", 
					"Geese a Laying", "Swans a Swimming", "Maids a Milking", "Ladies Dancing", 
					"Lords a Leaping", "Pipers Piping", "Drummers Drumming"};
	
	for (int i = 0; i < 12; ++i)
	{
		string gift;
		ostringstream bufferSetup;
		ostringstream giftStream;
		bufferSetup << "On the " << whatDay[i] << " day of Christmas my true love sent to me:" << endl;
		cout << bufferSetup.str();
		giftStream << howMany[i] << gifts[i] << endl;
		gift = giftStream.str();
		repeat(gift);
	}
}