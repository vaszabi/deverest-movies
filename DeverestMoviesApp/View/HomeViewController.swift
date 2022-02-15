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
    @IBOutlet weak var tableView: UITableView!
    
    var moviesArray: [MovieViewModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var presenter = HomePresenter()
    
    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        setupViews()
        
    }
    
    //MARK: Private methods
    private func setupViews() {
        titleLabel.font = UIFont(name: "Helvetica-Bold", size: 25.0)
        titleLabel.text = "Movies"
        searchTextField.delegate = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
    }
}

//MARK: TextFieldDelegate conform
extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let keyword = textField.text else {
            print("No text alert")
            return
        }
        presenter.getMovies(with: keyword)
    }
}

//MARK: TableView conform
extension HomeViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        moviesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
        let movie = moviesArray[indexPath.row]
        cell.setData(with: movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

