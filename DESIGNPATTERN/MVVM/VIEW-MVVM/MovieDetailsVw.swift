//
//  MovieDetailsVw.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 06/09/22.
//

import UIKit
import AVKit

class MovieDetailsVw: UIView {
    @IBOutlet weak var videoContainer: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var writerLabel: UILabel!
    @IBOutlet weak var storyline: UILabel!
    @IBOutlet weak var readMore: UIButton!
    
    private var model: MovieDetailsViewModelProtocol?

    private override init(frame: CGRect) {
        super.init(frame: frame)
        loadContent()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadContent()
    }
    
    convenience init(frame: CGRect, model: MovieDetailsViewModelProtocol) {
        self.init(frame: frame)
        self.model = model
        bindModel()
    }
    
    private func loadContent() {
        guard let vw = self.loadNib(with: "MovieDetailsVw") else {return; }
        
        self.addSubview(vw)
     
        vw.translatesAutoresizingMaskIntoConstraints = false
        LayoutEngine().addConstraintsToSuperView(for: vw, and: [.leading(0), .trailing(0), .top(0), .bottom(0)])
    }
    
    @IBAction func clickedReadMore(_ sender: Any) {
        guard let isReadLess = self.model?.isReadLess.value else {return }
        
        self.model?.isReadLess.value = !isReadLess
    }
}

extension MovieDetailsVw {
    func bindModel() {
        self.model?.movie?.bind(listener: {[weak self] movie in
            guard let temp = movie,
                  let movie = temp else {return }
            
            self?.updateUI(with: movie)
        })
        
        self.model?.isReadLess.bind(listener: {[weak self] isReadLessStatus in
            guard let `self` = self, let status = isReadLessStatus else {return }
            
            let text = status ?"Read Less" : "Read More"
            self.readMore.setTitle(text, for: .normal)
    
            self.storyline.numberOfLines = status ? 0 : 2
        })
        
    }
    
    private func updateUI(with movie: Movie?) {
        guard let movie = movie else {return }

        imageView.image = model?.moviePoster(for: movie)
        nameLabel.text = model?.name(for: movie)
        ratingLabel.text = model?.rating(for: movie)
        dateLabel.text = model?.releaseDate(for: movie)
        writerLabel.text = model?.writer(for: movie)
        
        storyline.numberOfLines = 2
        storyline.text = model?.storyline(for: movie)
        addPlayer(for: movie)
    }
    
    private func addPlayer(for movie: Movie) {
        guard let player = self.model?.player(for: movie) else {return; }
     
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.videoContainer.bounds
        self.videoContainer.layer.addSublayer(playerLayer)
        player.play()
    }
}
