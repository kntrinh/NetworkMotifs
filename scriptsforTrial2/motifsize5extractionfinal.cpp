#include "pch.h"
#include <fstream>
#include <iostream>
#include <cstdlib>
#include <string>
#include <sstream>

using namespace std;

int main()
{
	//CHANGE THESE VARIABLES---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	//string simulationnumber = "13";   // CHANGE this number to the simulation number from which you are extracting the motif data
	string simnum[15] = { "2", "3", "4", "5", "6", "7", "10", "12", "14", "15", "17", "21", "22", "23", "24" };
		//file paths / filenames
								//string folderpath = "D:\\previousPC\\school\\Research\\motif" + simulationnumber + "undirected\\";  // this is your working directory, CHANGE it to however your file folder system works
	/*motif variable*/		string endfilename = "size5_OUT.txt";																// ending suffix of the files of interest
	string csvfilepath;							//creates the file path of where you will save the file, CHANGE it to whereever you want it to be
	string csvfilename = "_motifSIZE5data.csv";      //this is your output file name, you can CHANGE it to whatever is easier for you to find
		//csvfilepath = folderpath + "simulation" + simulationnumber + csvfilename;
	//ofstream arrayData(csvfilepath);			//creates the outputfile

//motif variables
	/*motif variable*/	const int numberofmotiftypes = 21;  // this number indicates how many motif types there are, CHANGE accordingly to whatever motif size you're extracting
																// for size 3 motifs, there are 2
																// for size 4 motifs, there are 6
																// for size 5 motifs, there are 21
																// for size 6 motifs, there are __
	string search[numberofmotiftypes] = { "1082430", "1083578", "1084606", "1117588", "1117622","1150364", "1150398", "1255858", "1256886", "1289662", "3248028", "3248062", "3319358", "3320472", "3320506", "3321534", "3387292", "3387326", "7595838", "7598014" , "16510910" };
	// these are the motif id types, CHANGE accordingly to whatever motif size you're extracting

	// MISCELLANOUS VARIABLES-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	int stepsize = 50;					// this number indicates the stepsize of your files
	const int timesteps = 10000;		// this number shows how many timesteps there are, you can decrease it if you are only interested in doing a portion of it
	string datastore[timesteps + 1][2];//place to store all the data from the motif.txt files.
										//don't know why the number 2 works, it just does, might want to see someone with a good coding background to see why it works. if it goes past 3, the code breaks for some reason...

	stringstream coutstorage;			//creates stringstream object called coutstorage, this will be used to store the individual data values by using a method similar to cout
	string convertedcoutstorage;		//stores the contents of each coutstorage as a string variable
	//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	for (int num = 0; num < 15; num++)
	{
		string simulationnumber = simnum[num];

			string folderpath = "D:\\motiftrialtwo\\motif" + simulationnumber + "undirected\\motiffilesinputoutput\\";  // this is your working directory, CHANGE it to however your file folder system works
		csvfilepath = folderpath + "simulation" + simulationnumber + csvfilename;
		ofstream arrayData(csvfilepath);			//creates the outputfile


		// checks to see if file is correctly writing
		if (arrayData.is_open())
			cout << "File " << simulationnumber << " is writing..." << endl;
		else
			cout << "File " << simulationnumber << " Failed to Write... (try closing previous .csv file)" << endl;
		//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

		// this is the code that does the actual work of extracting the data
		for (int filereadcount = stepsize; filereadcount <= timesteps; filereadcount = filereadcount + stepsize)  // filereadcount indicates which number you are extracting from (in this case, it's 50, 100, 150 ... 9950, 10000) 
		{
			//float progress;
			//progress = filereadcount / timesteps * 100;
			cout << "Writing Progress: " << (float)filereadcount / timesteps * 100 << "% completed" << endl;  // you can track progress here, if you're interested in saving computation time, you can get rid of this line and the 2 preceding it

			string filepath;							//creates the filepath variable, this variable is used to find the motif text file
			filepath = folderpath + std::to_string(filereadcount) + endfilename;

			//---------------------------------------------------------------------------------------------------------------------------
			//checks to see if the motif text file was able to open
			ifstream fin;
			fin.open(filepath);
			if (fin.fail())
			{
				cout << "Input file opening failed.\n";
				exit(1);
			}
			//---------------------------------------------------------------------------------------------------------------------------

			// searches the file to see how many times that motif appears
			for (int motiftypenumber = 0; motiftypenumber < numberofmotiftypes; motiftypenumber++)  //motiftypenumber is used to cycle through the different motif types found from the variable search (line 30)
			{
				search[motiftypenumber];	// current motiftype the code is looking for

				bool isFound = 0;			// creation of boolean variable isFound
				while (!fin.eof())			// searches for the motif until the end of file is reached
				{
					//===========================================================================================================================================================================
					string temp = "";		// sets a temporary variable called temp
					getline(fin, temp);		// stores contents of the motif text file (line by line) into the temp variable
					for (int i = 0; i < search[motiftypenumber].size(); i++)
					{
						if (temp[i] == search[motiftypenumber][i])  // once the individual line of the motif text file is stored into the temp variable, we check its contents to see if the motif type exists within that line
							isFound = 1;							// it will go through the first few characters of the line to determine if it exists within that line, it is found, the isFound variable changes to true (or 1)
						else										// if it doesn't find it soon, it will change the isFound variable to false (or 0)
						{											// NOTE: this code is based on the assumption that the motif type ID is at the beginning of the line.  If it isn't you'll have to change the entire logic of how this code works. good luck...
							isFound = 0;
							break;
						}
					}
					//===========================================================================================================================================================================

					//based on the results from the previous loop, this next set of code will work accordingly
					//===========================================================================================================================================================================
					if (isFound)
					{
						for (int i = search[motiftypenumber].size() + 1; i < temp.size(); i++)
						{
							coutstorage << temp[i];  //begins storing the contents of the temp variable into coutstorage variable using a method similar to cout

							if (temp[i] == '	')	// once the character '		' (tab) is encountered, this loop will stop
							{
								coutstorage >> convertedcoutstorage;	//stores the contents of coutstorage into the string variable convertedcoutstorage
								datastore[filereadcount / stepsize][motiftypenumber] = convertedcoutstorage;	//stores this converted string variable to our datastorage variable
								//cout << datastore[filereadcount / stepsize][motiftypenumber] << "\t";			//useful in debugging
								arrayData << datastore[filereadcount / stepsize][motiftypenumber] << ",";		//takes the data from the datastorage variable and writes it to the csv file

								//this next bit of code acts whenever we finish looking for the final motif type in the file
								if (motiftypenumber == numberofmotiftypes - 1)
								{
									arrayData << endl;
									//	cout << endl;		//useful for debugging
								}
								break;

							}
						}
						break;
					}
				}
				//==============================================================================================================================================================================================
				// what to do if we we reach the end of the motif data text file and we are unable to find a match (crucial for size-5 motif)
				if (fin.eof() && (!isFound))
				{
					datastore[filereadcount / stepsize][motiftypenumber] = "0";					//if we can't find it, we assume the value is 0
					arrayData << datastore[filereadcount / stepsize][motiftypenumber] << ",";
					if (motiftypenumber == numberofmotiftypes - 1)
					{
						arrayData << endl;
						//cout << endl;
					}
					fin.clear();					//resets our file read so we can begin searching at the file again for different motif types
					fin.seekg(0, ios::beg);
				}
				//==============================================================================================================================================================================================

			}
			fin.close();						// closes the motif data text file so we don't waste memory (i think...)

		}
		//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		if (arrayData.is_open())
			cout << "File " << simulationnumber << " Write Finished!" << endl;
		else
			cout << "File " << simulationnumber << " Failed to Write... (try closing previous .csv file)" << endl;
		arrayData.close();  //closes the file that we were writing the data to
	}

	return 0;
}