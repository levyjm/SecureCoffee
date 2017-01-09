#include <iostream>
#include <cstring>
#include <string>
#include <fstream>
#include <vector>
#include <istream>
#include "boost/assign/std/vector.hpp"

using namespace std;
using namespace boost::assign;

void willItBlend(string scrambled, string desiredWord){
	
	int i = 0;
	int j = 0;

	string newWord;
	char desiredChar;
	int counter = scrambled.length() - 1;

	while (i <= counter) {
		desiredChar = desiredWord.at(j);
		if (scrambled.find(desiredChar) != -1) {
			scrambled.erase(scrambled.find(desiredChar), 1);
			newWord.append(1, desiredChar);
			i++;
			j++;
		} else if (scrambled.find('?') != -1) {
			scrambled.erase(scrambled.find('?'), 1);
			newWord.append(1, desiredChar);
			i++;
			j++;
			//break;
		} else {
			break;
		}	
	}

	if (newWord.compare(desiredWord)) {
		cout << "False! You are missing the character, " << desiredChar << "\n";
	} else {
		cout << "True! You did it!\n";
	}

}

vector<string> deleteInvalids(string word, vector<string>& stringArray) {
	int i = 0;
	int j = 0;
	int k = 0;
	//int l = 0;
	vector<string> newArray;
	while (j < stringArray.size()) {
		cout << stringArray.size() << "\n";
		while (i < word.length()) {
			if (stringArray[j].find(word.at(i)) != -1) {
				newArray[k] = stringArray[j];
				k++;
			}
			i++;
		}
		j++;
	}

	//for (int k = 0; k < stringArray.size(); k++) {
	///cout << stringArray[k] << "\n";
	//}
	

	return stringArray;
}

int main(){

	string scrambledWord;
	string desiredWord;
	vector<string> stringArray;
	ifstream textFile("enable1.txt");

	for (string line; getline(textFile, line); ) {
		stringArray.push_back(line);
	}

    cout << "Give me a scrambled word: ";
    cin >> scrambledWord;
    cout << "Now give the desired word: ";
    cin >> desiredWord;

    deleteInvalids(desiredWord, stringArray);


    //willItBlend(scrambledWord, desiredWord);

}