//#include "global_list.h"
//
//// Definition of storage and iterator
//std::list<std::string> globalList;
//std::list<std::string>::iterator globalIt = globalList.begin();
//
//void addToList(const std::string& s) {
//    globalList.push_back(s);
//    // If this is the very first insertion, reset iterator
//    if (globalList.size() == 1) {
//        globalIt = globalList.begin();
//    }
//}
//
//std::string getNext() {
//    if (globalIt != globalList.end()) {
//        std::string value = *globalIt;
//        ++globalIt;
//        return value;
//    }
//    return {};  // empty indicates “no more”
//}
//
//void resetIterator() {
//    globalIt = globalList.begin();
//}
//
//void clearList() {
//    globalList.clear();
//    resetIterator();
//}
