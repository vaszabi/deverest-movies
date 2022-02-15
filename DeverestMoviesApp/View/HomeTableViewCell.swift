//
//  HomeTableViewCell.swift
//  DeverestMoviesApp
//
//  Created by Szabolcs Varga on 2022. 02. 15..
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var posterImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(with viewModel: MovieViewModel) {
        self.titleLabel.text = viewModel.title
//        DispatchQueue.main.async {
//            viewModel.getBudget(completionHandler: { budget in
//                self.budgetLabel.text = "\(budget)"
//            })
//        }
//        DispatchQueue.main.async {
//            viewModel.getPosterImg { poster in
//                self.posterImg.image = poster
//            }
//        }
    }
    
}
