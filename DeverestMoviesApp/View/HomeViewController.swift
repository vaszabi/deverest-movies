//
//  HomeViewController.swift
//  DeverestMoviesApp
//
//  Created by Szabolcs Varga on 2022. 02. 14..
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField! {
        didSet {
            searchTextField.tintColor = UIColor.lightGray
            searchTextField.setIcon(UIImage(imageLiteralResourceName: "searchicon"))
        }
    }
    
    var presenter = HomePresenter()
    
    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        setupViews()
        presenter.getMovies()
    }

    //MARK: Private methods
    private func setupViews() {
        titleLabel.font = UIFont(name: "Helvetica-Bold", size: 25.0)
        titleLabel.text = "Movies"
    }

}

