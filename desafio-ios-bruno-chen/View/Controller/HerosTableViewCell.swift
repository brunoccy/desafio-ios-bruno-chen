//
//  Heros2TableViewCell.swift
//  desafio-ios-bruno-chen
//
//  Created by Bruno Chen on 28/04/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import UIKit
import Kingfisher

class HerosTableViewCell: UITableViewCell {
    @IBOutlet weak var imageViewHero: UIImageView!
    @IBOutlet weak var labelHeroName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
        
    func loadCell(with hero: Hero) {
        labelHeroName.text = hero.name
        if let imageUrlString = URL(string: hero.thumbnail.url) {
            imageViewHero.kf.indicatorType = .activity
            imageViewHero.kf.setImage(with: imageUrlString)
        } else {
            imageViewHero.image = nil
        }
        imageViewHero.layer.cornerRadius = imageViewHero.frame.size.height/2
        imageViewHero.layer.borderColor = UIColor.red.cgColor
        imageViewHero.layer.borderWidth = 2
    }
}
