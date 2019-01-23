#include <iostream>       // std::cout
#include <thread>         // std::thread
#include <mutex>          // std::mutex
#include <fstream>
#include <list>
#include <vector>
#include <chrono>

using namespace std;



class ItemProcessor{
  public:
    ItemProcessor();
    ItemProcessor(const string &inputFilePath, const string &outputFilePath){
      this-> inputFilePath = inputFilePath;
      this-> outputFilePath = outputFilePath;

    }
    //~ItemProcessor();

    bool start();
  
  protected:
    bool openFiles();
    bool readFile();
    bool process(list<string>::iterator &);
    void closeFiles();
    void insertionSort(vector<int> &);
    vector<int> build_vector(string &);
    void writeFile(vector <int> &v);
    
  
  private:
    string inputFilePath, outputFilePath;
  	list<string> itemsList;
  	mutex mtxRead, mtxWrite;
    ifstream inputFile;
    ofstream outputFile;
};

bool ItemProcessor::openFiles(){

inputFile.open(inputFilePath);
outputFile.open (outputFilePath);

if(inputFile.fail() || outputFile.fail())
  return false;
else 
  return true;

}
void ItemProcessor::closeFiles(){
  inputFile.close();
  outputFile.close();
}

bool ItemProcessor::readFile(){

  string item;
  
  while(!inputFile.eof())     //storing the input in memory for best performance
  {
    getline(inputFile,item);
    itemsList.push_back(item);
  }

  if(itemsList.size() > 0)
    return true;
  else
    return false;

}

vector<int> ItemProcessor::build_vector(string &line)
{
           //Unlock the mutex (locked in line 80) inorder to another thread can build another vector at same time
  cout<<"BuildingVector "<<endl;
  vector<int> vectorNoBlanks;
  
  for(char& c : line)
  {
    if(c != ' ')
    {
      vectorNoBlanks.push_back(c - '0');
    }
    else if (c == ' ')
    {
      this_thread::sleep_for (chrono::seconds(1));   //Blank space found, this thread must wait 1 sec
    }
  } 

  return vectorNoBlanks;

}

void ItemProcessor::insertionSort(vector<int> &vectorNoBlanks){

  cout<<"Sorting "<<endl;
    int i, j, tmp;

    for (i = 1; i < (int)vectorNoBlanks.size(); i++) 
    {
        j = i;
        while (j > 0 && vectorNoBlanks[j - 1] > vectorNoBlanks[j])
         {
            tmp = vectorNoBlanks[j];
            vectorNoBlanks[j] = vectorNoBlanks[j - 1];
            vectorNoBlanks[j - 1] = tmp;
            j--;
        }
    }
}

void ItemProcessor::writeFile (vector <int> &v)
{
  
  string lineSorted;
  mtxWrite.lock(); // critical section (exclusive access to the outputfile signaled by locking mtxWrite):

   //Writing in the outputFile the sorted vector and separeted by comas
  for (vector<int>::iterator it=v.begin(); it != v.end(); ++it)
  {
    
    lineSorted+= to_string(*it);
    outputFile << *it << ","; 
    
  }

  cout<<lineSorted<<endl;
  outputFile << '\n';//Adding end line after wiriting the line
  cout<<"Writing in file "<<endl;
  mtxWrite.unlock(); //unloking the write file inorder to get another trhead acces to the file

}

bool ItemProcessor::process(list<string>::iterator &it)
{
  cout<<"ProcessingLine "<<endl;
  mtxRead.lock();   
  while (it != itemsList.end())   //while are items to proces
  {             
    
    string item = *it;// store the item in a temp variable in order to gabe acces to the information to anther thread
    
   // mtxRead.lock();                //Lock the mutex 
    it++;  
    //mtxRead.unlock();
    mtxRead.unlock();                        // next item to proces
    vector<int> vectorNoBlanks = build_vector(item); // build the vector
    insertionSort(vectorNoBlanks);  //sort the vector
    writeFile(vectorNoBlanks); // write in file the vector  

  }

  return true;
}

bool ItemProcessor::start(){

    bool couldOpen = openFiles();
    bool wasFileRead = readFile();
    bool isOK = couldOpen + wasFileRead;

    
    if (itemsList.empty())
        return false;

    list<string>::iterator it=itemsList.begin();
    
  thread workerThread1 (&ItemProcessor::process ,this ,ref(it));
  thread workerThread2 (&ItemProcessor::process ,this ,ref(it));
  thread workerThread3 (&ItemProcessor::process ,this ,ref(it));
  thread workerThread4 (&ItemProcessor::process ,this ,ref(it));
   
//join al threads to the mainthread
  workerThread1.join();
  workerThread2.join();
  workerThread3.join();
  workerThread4.join();

  closeFiles();

  return isOK;
}
