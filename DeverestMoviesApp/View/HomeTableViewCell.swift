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
        DispatchQueue.main.async {
            viewModel.getBudget(completionHandler: {[weak self] budget in
                DispatchQueue.main.async {
                    self?.budgetLabel.text = "Budget: \(budget)"
                }
            })
        }
        DispatchQueue.main.async {
            viewModel.getPosterImg {[weak self] poster in
                DispatchQueue.main.async {
                    self?.posterImg.image = poster
                }
            }
        }
    }
    
}
