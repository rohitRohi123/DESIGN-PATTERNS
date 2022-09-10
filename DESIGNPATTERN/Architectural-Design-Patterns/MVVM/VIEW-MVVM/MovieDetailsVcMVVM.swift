//
//  MovieDetailsVcMVVM.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 06/09/22.
//

import UIKit

class MovieDetailsVcMVVM: UIViewController {
    var model: MovieDetailsViewModelProtocol?
    var selectedMovie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        uiSetup()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        model?.player?.pause()
    }
    
    private func uiSetup() {
        if self.model == nil {
            self.model = MovieDetailsViewModel()
        }
     
        let detailsVs = MovieDetailsVw(frame: self.view.bounds, model: self.model!)
        self.view.addSubview(detailsVs)
        
        detailsVs.translatesAutoresizingMaskIntoConstraints = false
        LayoutEngine().addConstraintsToSuperView(for: detailsVs, and: [.top(0), .bottom(0), .leading(0), .trailing(0)])
        
        self.model?.movie?.value = selectedMovie
    }
    
}



