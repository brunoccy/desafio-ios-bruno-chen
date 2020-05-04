//
//  HeroDetailViewController.swift
//  desafio-ios-bruno-chen
//
//  Created by Bruno Chen on 26/04/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import UIKit
import WebKit
import Kingfisher

protocol HeroDetailViewControllerProtocol {
     func loadHeroDetail(heroDetail: (name: String, description: String, url: String))
}

class HeroDetailViewController: UIViewController, HeroDetailViewControllerProtocol {

    @IBOutlet weak var imageViewHero: UIImageView!
    @IBOutlet weak var labelHeroName: UILabel!
    @IBOutlet weak var textViewDescription: UITextView!
    
    var hero: Hero!
    var heroDetailPresenter: HeroDetailPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        heroDetailPresenter = heroDetailPresenter ?? HeroDetailPresenter()
        heroDetailPresenter.onViewLoaded(heroDetailView: self)
        heroDetailPresenter.getHeroDetail(hero: hero)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let target = segue.destination as! ComicsViewController
        target.hero = hero
    }
    
    func loadHeroDetail(heroDetail: (name: String, description: String, url: String)) {
      labelHeroName.text = heroDetail.name
        textViewDescription.text = heroDetail.description
      if let imageUrlString = URL(string: heroDetail.url) {
          imageViewHero.kf.indicatorType = .activity
          imageViewHero.kf.setImage(with: imageUrlString)
      } else {
          imageViewHero.image = nil
      }
    }

}
