//
//  ComicsViewController.swift
//  desafio-ios-bruno-chen
//
//  Created by Bruno Chen on 26/04/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import UIKit

class ComicsViewController: UIViewController {

    @IBOutlet weak var labelComicsName: UILabel!
    @IBOutlet weak var imageViewComics: UIImageView!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var textFieldDescription: UITextView!
    @IBOutlet weak var viewLoading: UIView!
    @IBOutlet weak var aiLoading: UIActivityIndicatorView!
    
    var hero: Hero!
    var comicsPresenter: ComicsPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aiLoading.startAnimating()
        viewLoading.isHidden = false
        comicsPresenter = comicsPresenter ?? ComicsPresenter()
        comicsPresenter.onViewLoaded(comicsView: self)
        comicsPresenter.loadComic(heroid: hero.id)
    }
    
    func loadExpensiveComic(comics: (title: String, price: Float, description: String?, url: String)) {

            self.labelComicsName.text = comics.title
            self.labelPrice.text = "US$: \(String(comics.price))"
            self.textFieldDescription.text = comics.description
            if let imageUrlString = URL(string: comics.url) {
                self.imageViewComics.kf.indicatorType = .activity
                self.imageViewComics.kf.setImage(with: imageUrlString)
            } else {
                self.imageViewComics.image = nil
            }
            self.viewLoading.isHidden = true
            self.aiLoading.stopAnimating()

    }

}
