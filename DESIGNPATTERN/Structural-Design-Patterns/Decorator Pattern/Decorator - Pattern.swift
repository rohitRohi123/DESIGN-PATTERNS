//
//  Decorator - Pattern.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 13/09/22.
//

import Foundation

// The component interface defines operations that can be
// altered by decorators.
protocol DataSource {
    func write(data: String)
    func read()-> String
}


// Concrete components provide default implementations for the
// operations. There might be several variations of these
// classes in a program.
class FileDataSource: DataSource {
    init(with fileName: String) {}
    
    func write(data: String) {
        debugPrint("Written data = \(data)")
    }
    
    func read() -> String {
         debugPrint("Read data from store")
        return ""
    }
}


// The base decorator class follows the same interface as the
// other components. The primary purpose of this class is to
// define the wrapping interface for all concrete decorators.
// The default implementation of the wrapping code might include
// a field for storing a wrapped component and the means to
// initialize it.
class DataSourceDecorator: DataSource {
    fileprivate let wrappee: DataSource
    
    init(with wrappee: DataSource) {
        self.wrappee = wrappee
    }
    
    // The base decorator simply delegates all work to the
       // wrapped component. Extra behaviors can be added in
       // concrete decorators.
    func write(data: String) {
        wrappee.write(data: data)
        
    }
    
    // Concrete decorators may call the parent implementation of
      // the operation instead of calling the wrapped object
      // directly. This approach simplifies extension of decorator
      // classes.
    func read() -> String {
        return wrappee.read()
    }
}

// Concrete decorators must call methods on the wrapped object,
// but may add something of their own to the result. Decorators
// can execute the added behavior either before or after the
// call to a wrapped object.
class EncryptAndDecryptDecorator: DataSourceDecorator {
    override func write(data: String) {
        // 1. Encrypt passed data.
        // 2. Pass encrypted data to the wrappee's writeData
        // method.
        let encryptedData = "sdsf 23434 nsdf  sdjf 2342rsd"
        self.wrappee.write(data: encryptedData)
    }
    
    override func read() -> String {
        // 1. Get data from the wrappee's readData method.
        // 2. Try to decrypt it if it's encrypted.
        // 3. Return the result.
        wrappee.read()
    }
}

// You can wrap objects in several layers of decorators.
class CompressionDecorator: DataSourceDecorator {
    override func write(data: String) {
        // 1. Compress passed data.
        // 2. Pass compressed data to the wrappee's writeData
        // method.
        wrappee.write(data: "Compressed data")
    }
 
    override func read() -> String {
        // 1. Get data from the wrappee's readData method.
        // 2. Try to decompress it if it's compressed.
        // 3. Return the result.
        return "Decompressed data"
    }
}


// Option 1. A simple example of a decorator assembly.
class Application {
     func dumbUsageExample() {
         var source: DataSource = FileDataSource(with: "somefile.dat")
        source.write(data: "salaryRecords")
        // The target file has been written with plain data.

        source = CompressionDecorator(with: source)
        source.write(data: "salaryRecords")
        // The target file has been written with compressed
        // data.

        source = EncryptAndDecryptDecorator(with: source)
        // The source variable now contains this:
        // Encryption > Compression > FileDataSource
        source.write(data: "salaryRecords")
        // The file has been written with compressed and
        // encrypted data.
     }
}


// Option 2. Client code that uses an external data source.
// SalaryManager objects neither know nor care about data
// storage specifics. They work with a pre-configured data
// source received from the app configurator.
class SalaryManager {
    let source: DataSource

    init(with source: DataSource) {
        self.source = source
    }

    func load() {
        return source.read()
    }
    
    func save() {
        source.write(data: "salaryRecords")
        // ...Other useful methods...
    }
}

// The app can assemble different stacks of decorators at
// runtime, depending on the configuration or environment.
class ApplicationConfigurator {
    func configurationExample() {
        var source: DataSource = FileDataSource(with: "salary.dat")
        let condition: String = "enabledEncryption"
        
        if (condition == "enabledEncryption") {
            source = EncryptAndDecryptDecorator(with: source)
        }
        
        if (condition == "enabledCompression") {
            source = CompressionDecorator(with: source)
        }
        
       var logger = SalaryManager(with: source)
       var salary = logger.load()
        // ...
    }
}
