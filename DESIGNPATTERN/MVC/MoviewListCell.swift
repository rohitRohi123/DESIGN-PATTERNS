//
//  MoviewListCell.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 04/09/22.
//

import UIKit

class MoviewListCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var moviewPoster: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var writer: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        prepareCellUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func prepareCellUI() {
        self.containerView.clipsToBounds = true
        self.containerView.layer.cornerRadius = 16
        
    }
    
    func updateCell(with movie: Movie) {
        if let id = movie.id {
            moviewPoster.image = UIImage(named: "\(id)" )
        }
        
        if let name = movie.name {
            self.name.text  = "Name: \(name)"
        }
        
        if let rating = movie.rating {
            self.rating.text  = "Rating: \(rating)"
            
        }
        
        if let date = movie.release_date {
            releaseDate.text  = "Release date: \(date)"
        }
        
        if let writer = movie.writer {
            self.writer.text  = "Writer: \(writer)"
        }
        
    }
    
}
