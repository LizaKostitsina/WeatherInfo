//
//  ViewController.swift
//  White&FluffyTestTask
//
//  Created by Liza Kostitsina on 30.08.2021.
//

import UIKit
import Alamofire

class StartScreenViewController: UIViewController {
    
    //MARK: - Properties
    
    var weatherArray = [Weather]()
    var filteredArray = [Weather]()
    
    //MARK: - UI elements
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        return searchBar
    }()
    
    lazy var cityListTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .singleLine
        return tableView
    }()
    
    lazy var navigationBar: CustomNavigationBar = {
        let navigationBar = CustomNavigationBar()
        return navigationBar
    }()
    
    //MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkMethods.parseJson(with: NetworkConstants.urls, completion:{ [weak self] weatherArray in
            self?.weatherArray = weatherArray
            self?.filteredArray = weatherArray
            self?.cityListTableView.reloadData()
            guard let isEmpty = self?.weatherArray.isEmpty else { return }
            if isEmpty {
                self?.showErrorAlert()
            }
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        addSubviews()
        makeConstraints()
        setupTableView()
    }
    
    //MARK: - Private methods
    
    private func addSubviews() {
        self.view.addSubview(searchBar)
        self.view.addSubview(cityListTableView)
        self.navigationController?.navigationBar.addSubview(self.navigationBar)
    }
    
    private func makeConstraints() {
        //MARK: - navigationBar constraints
        self.navigationBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: navigationBar, attribute: .leading, relatedBy: .equal, toItem: self.navigationController?.navigationBar, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: navigationBar, attribute: .trailing, relatedBy: .equal, toItem: self.navigationController?.navigationBar, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: navigationBar, attribute: .top, relatedBy: .equal, toItem: self.navigationController?.navigationBar, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: navigationBar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 70).isActive = true
        
        //MARK: - searchBar constraints
        self.searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: searchBar, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: searchBar, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: -10).isActive = true
        NSLayoutConstraint(item: searchBar, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 100).isActive = true
        NSLayoutConstraint(item: searchBar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40).isActive = true
        
        //MARK: - cityListTableView constraints
        self.cityListTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: cityListTableView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: cityListTableView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: cityListTableView, attribute: .top, relatedBy: .equal, toItem: self.searchBar, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: cityListTableView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
    }
    
    private func setupTableView() {
        cityListTableView.delegate = self
        cityListTableView.dataSource = self
        cityListTableView.register(CityListTableViewCell.self, forCellReuseIdentifier: CityListTableViewCell.reuseIdentifier)
    }
    
    private func showErrorAlert() {
        let alert = UIAlertController(title: "Данные с сервера не получены", message: "Пожалуйста, сделайте запрос позже", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
