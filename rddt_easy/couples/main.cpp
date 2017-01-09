#include <iostream>
#include <stdio.h>
#include <stdlib.h> 
#include <string>

using namespace std;


void scramble(char **words, int totalChars) {
	int i = 0;
	int j = 0;
	int z = 0;

	printf("%s\n", words[0]);
	while (i < totalChars / 2) {
		words[0][i] = words[1][i];
		printf("%s\n", words[0]);
		i++;
	}
}

void scrambleSentence(string sentence1, string sentence2) {

	int i = 0;

	const char *sentences[2];
	char *sentences_writable[2];
	sentences[0] = (char*) sentence1.c_str();
	sentences[1] = (char*) sentence2.c_str();

	sentences_writable[0] = (char*) sentences[0];
	sentences_writable[1] = (char*) sentences[1];

	int totalChars = strlen(sentences[0]);
	while (i < totalChars) {

		sentences_writable[0][i] = sentences[1][i];
		printf("%s\n", sentences_writable[0]);
		i++;
	}
}

int main(int argc, char **argv) {

	int i = 0;
	int z = 2;
	int totalChars;
	char *wordz[2];

	string sentence1;
	string sentence2;

	if (strncmp(argv[1], "word", 4) == 0) {
		while (i < 2) {
			wordz[i] = argv[z];
    		totalChars += strlen(wordz[i]);
    		i++;
    		z++;
    	}

    	totalChars = totalChars - 1;
    	scramble(wordz, totalChars);
	} else if (strncmp(argv[1], "sentence", 4) == 0) {
		getline(cin, sentence1);
		getline(cin, sentence2);
		printf("\n");
		cout << sentence1 << endl;
		scrambleSentence(sentence1, sentence2);
	}

	return 0;
	
}