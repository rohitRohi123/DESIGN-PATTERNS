//
//  MoviewListCellMVVM.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 06/09/22.
//

import UIKit

class MoviewListCellMVVM: UITableViewCell {
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
    
    func updateCell(with image: UIImage?,
                    name: String,
                    rating: String,
                    releaseDate: String,
                    writer: String) {
        moviewPoster.image = image
        self.name.text  = name
        self.rating.text  = rating
        self.releaseDate.text  = releaseDate
        self.writer.text  = writer
    }
}
