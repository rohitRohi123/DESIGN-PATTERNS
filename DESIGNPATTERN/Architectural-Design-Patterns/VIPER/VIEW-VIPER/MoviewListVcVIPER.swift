//
//  MoviewListVcVIPER.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 07/09/22.
//

import UIKit

class MoviewListVcVIPER: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    
        uiSetup()
    }
   
}

//MARK: - UI Setup
extension MoviewListVcVIPER {
    private func uiSetup() {
        let movieListVw = MovieListVwVIPER(with: self.view.bounds, and: MoviewListPresenter())
        self.view.addSubview(movieListVw)
        
        movieListVw.translatesAutoresizingMaskIntoConstraints = false
        LayoutEngine().addConstraintsToSuperView(for: movieListVw, and: [.leading(0), .trailing(0), .top(0), .bottom(0)])
    }
    
}

