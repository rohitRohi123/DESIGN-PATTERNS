//
//  Facade.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 13/09/22.
//

import Foundation

enum FileSystem {
    case coredata, keychain, userdefault, filesystem
}

protocol FileSystemOperations {
    func save(data: Data, with fileName: String, into fileSystem: FileSystem)
    func readData(from fileName: String, and fileSystem: FileSystem)
}


//FACADE INTERFACE FOR LOCAL DB OPERATIONS
struct FileOperation: FileSystemOperations {
    func readData(from fileName: String, and fileSystem: FileSystem) {
        
    }
    
    func save(data: Data, with fileName: String, into fileSystem: FileSystem) {
        switch fileSystem {
        case .coredata:
             CoreDataOperations()
            
        case .keychain:
            KeychainOperations()
            
        case .userdefault:
            UserDefaultOperation()
            
        case .filesystem:
            FileSystemOperation()
        }
        
    }
    
}


fileprivate class UserDefaultOperation {
    //Perform all user default operation
    
}

fileprivate class FileSystemOperation {
    //Perform all required file system operations
    
}

fileprivate class KeychainOperations {
    //Perform all KeychainOperations
    
}

fileprivate class CoreDataOperations {
    //Perform all the core data operation
}
