#include <iostream>
#include <fstream>
#include <vector>
#include <chrono>

using namespace std;

vector<int> num1, num2, result;
int len1, len2, maxLen;

void generateVector(int digitNum, string fileName) {
	ofstream out(fileName);
	out << digitNum << '\n';

	for (int i = 0; i < digitNum; i++) {
		int x = rand() % 9 + 1;	// generating digits in the [1, 9] interval
		out << x << ' ';
	}

	out.close();
}

bool checkCorrectness(string fileName) {
	ifstream in(fileName);

	int digitNum;
	int expected[100001];

	in >> digitNum;
	for (int i = 0; i < digitNum; i++) {
		in >> expected[i];
	}

	in.close();

	// Debug: verificare dimensiuni
	cout << "Expected size: " << digitNum << ", Result size: " << result.size() << endl;

	if (digitNum != result.size()) {
		return false;
	}

	// Debug: comparare element cu element
	for (int i = 0; i < result.size(); i++) {
		if (expected[i] != result[i]) {
			cout << "Mismatch at index " << i << ": expected " << expected[i] << ", got " << result[i] << endl;
			return false;
		}
	}

	return true;
}

void readVectors(string fileName1, string fileName2) {
	ifstream in(fileName1);

	int digit;
	in >> len1;

	// Debug: citire vector 1
	cout << "Reading vector 1 with length: " << len1 << endl;
	for (int i = 0; i < len1; i++) {
		in >> digit;
		num1.push_back(digit);
		cout << digit << " ";
	}
	cout << endl;
	in.close();

	ifstream in2(fileName2);
	in2 >> len2;

	// Debug: citire vector 2
	cout << "Reading vector 2 with length: " << len2 << endl;
	for (int i = 0; i < len2; i++) {
		in2 >> digit;
		num2.push_back(digit);
		cout << digit << " ";
	}
	cout << endl;
	in2.close();

	maxLen = max(len1, len2);
	num1.resize(maxLen);
	num2.resize(maxLen);
	result.resize(maxLen);
}

void writeResult(string fileName) {
	ofstream out(fileName);

	out << result.size() << '\n';

	// Debug: scriere rezultat
	cout << "Writing result with size: " << result.size() << endl;
	for (int x : result) {
		out << x << ' ';
		cout << x << " ";
	}
	cout << endl;

	out.close();
}

void addVectors() {
	int carry = 0;

	// Debug: adunare vectori
	cout << "Adding vectors:" << endl;
	for (int i = 0; i < maxLen; i++) {
		int sum = num1[i] + num2[i] + carry;
		result[i] = sum % 10;
		carry = sum / 10;
		cout << "Index " << i << ": num1 = " << num1[i] << ", num2 = " << num2[i] << ", carry = " << carry << ", result = " << result[i] << endl;
	}

	// Accounting for the extra digit
	if (carry == 1) {
		result.resize(maxLen + 1);
		result[maxLen] = 1;
		cout << "Extra carry added at index " << maxLen << endl;
	}
}

int main(int argc, char** argv) {

	generateVector(1000, "D:\\Facultate - Github\\Facultate\\PPD\\LAB 3\\LAB 3\\InputsNumar1_2.txt");
	generateVector(1000, "D:\\Facultate - Github\\Facultate\\PPD\\LAB 3\\LAB 3\\InputsNumar2_2.txt");

	readVectors("D:\\Facultate - Github\\Facultate\\PPD\\LAB 3\\LAB 3\\Inputs\\Numar1_2.txt", "D:\\Facultate - Github\\Facultate\\PPD\\LAB 3\\LAB 3\\Inputs\\Numar2_2.txt");

	auto startTime = chrono::high_resolution_clock::now();

	addVectors();

	auto endTime = chrono::high_resolution_clock::now();

	if (checkCorrectness("D:\\Facultate - Github\\Facultate\\PPD\\LAB 3\\LAB 3\\Outputs\\Expected_2.txt")) {
		writeResult("D:\\Facultate - Github\\Facultate\\PPD\\LAB 3\\LAB 3\\Outputs\\Numar3_2.txt");
		cout << "Correct result! Execution time: " << chrono::duration<double, milli>(endTime - startTime).count() << " ms" << endl;
	}
	else {
		cout << "INCORRECT RESULT!\n";
	}
}
