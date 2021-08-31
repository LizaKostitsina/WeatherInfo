//
//  MoreInfoViewController.swift
//  White&FluffyTestTask
//
//  Created by Liza Kostitsina on 31.08.2021.
//

import UIKit

class MoreInfoViewController: UIViewController {
    
    //MARK: - UI elements
    
    lazy var cityNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Georgia", size: 30)
        label.textAlignment = .center
        return label
    }()
    
    lazy var partsOftheDayTempretureTableView: UITableView = {
       let tableView = UITableView()
        
        return tableView
    }()

    //MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        makeConstraints()
    }
     //MARK: - Private methods
    
    private func addSubviews() {
        self.view.addSubview(cityNameLabel)
    }
    
    private func makeConstraints() {
        //MARK: - cityNameLabel constraints
        self.cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: cityNameLabel, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: cityNameLabel, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: cityNameLabel, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 60).isActive = true
        NSLayoutConstraint(item: cityNameLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 60).isActive = true
        
        //MARK: - partsOftheDayTempretureTableView constraints
        self.partsOftheDayTempretureTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: partsOftheDayTempretureTableView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: partsOftheDayTempretureTableView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: partsOftheDayTempretureTableView, attribute: .top, relatedBy: .equal, toItem: self.cityNameLabel, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: partsOftheDayTempretureTableView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
    }
    
    private func setupTableView() {
        self.partsOftheDayTempretureTableView.delegate = self
        self.partsOftheDayTempretureTableView.dataSource = self
        self.partsOftheDayTempretureTableView.register(PartOfTheDatTempretureTableViewCell.self, forCellReuseIdentifier: PartOfTheDatTempretureTableViewCell.reuseIdentifier)
    }
}
