//  MovieListVcMVVM.swift
//  DESIGNPATTERN
//  Created by Rohit Chauhan on 06/09/22.

import UIKit

class MovieListVcMVVM: UIViewController {
    var model: (MoviesListViewModelProtocol & LoadingProtocol)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        uiSetup()
    }

}

//MARK: - UI Setup
extension MovieListVcMVVM {
    private func uiSetup() {
        if model == nil {
            model = MoviesListViewModel()
        }
        
        let moviewListVw = MoviewListViewMVVM(frame: self.view.frame, model: model!)
        moviewListVw.delegate = self
        
       self.view.addSubview(moviewListVw)
        
        moviewListVw.translatesAutoresizingMaskIntoConstraints = false
        LayoutEngine().addConstraintsToSuperView(for: moviewListVw, and: [.leading(0), .trailing(0), .top(0), .bottom(0)])
    }
    
}


extension MovieListVcMVVM: MovieListViewDelegate {
    func didSelect(movie: Movie) {
        let movieDetailVc = MovieDetailsVcMVVM()
        movieDetailVc.selectedMovie = movie
     
        self.navigationController?.pushViewController(movieDetailVc, animated: true)
    }
    
}
