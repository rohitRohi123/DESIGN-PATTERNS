//  Created by Rohit Chauhan on 06/09/22.

import Foundation

class Dynamic<T> {
    typealias Listener = (T?)-> Void
    var listener: Listener?
    
    convenience init(value: T) {
        self.init()
        
        self.value = value
    }
    
    func bind(listener:@escaping
              Listener) {
        self.listener = listener
    }
    
    func bindAndFire(listener: @escaping Listener) {
        self.listener = listener
        
        listener(value)
    }
    
    var value: T? {
        didSet {
            listener?(value)
        }
    }
}
