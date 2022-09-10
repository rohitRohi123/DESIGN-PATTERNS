//
//  MoviewDetailsVC.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 05/09/22.
//

import UIKit
import AVKit
import AVFoundation

class MoviewDetailsVC: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var videoContainer: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var writerLabel: UILabel!
    @IBOutlet weak var storyline: UILabel!
    @IBOutlet weak var readMore: UIButton!
    
    var isReadLess: Bool = false
    var movie: Movie?
    
    lazy var player: AVPlayer? = { [weak self] in
        guard let id = self?.movie?.id,
              let url = Bundle.main.url(forResource: "\(id)", withExtension: "mp4") else {return nil }
         let avPlayer = AVPlayer(url: url)
        
        
         return avPlayer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
        playVideo()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.player?.pause()
    }
    
    @IBAction func clickedReadMore(_ sender: Any) {
        isReadLess = !isReadLess

        let text = isReadLess ?"Read Less" : "Read More"
        self.readMore.setTitle(text, for: .normal)

        self.storyline.numberOfLines = isReadLess ? 0 : 2
    }
    
    private func playVideo() {
        guard let player = self.player else {return; }
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.videoContainer.bounds
        self.videoContainer.layer.addSublayer(playerLayer)
        player.play()
    }
    
    private func updateUI() {
        if let id = movie?.id {
            imageView.image = UIImage(named: "\(id)" )
        }
        
        if let name = movie?.name {
            self.nameLabel.text = name
        }
        
        if let rating = movie?.rating {
            self.ratingLabel.text = "Rating: \(rating)"
        }
        
        if let releaseDate = movie?.release_date {
            self.dateLabel.text = "Release date: \(releaseDate)"
        }
        
        if let writer = movie?.writer {
            self.writerLabel.text = "Writer: \(writer)"
        }
        
        if let storyline = self.movie?.description {
            self.storyline.numberOfLines = 2
            self.storyline.text = storyline
        }
    }
    
}
