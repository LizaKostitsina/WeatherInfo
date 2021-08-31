//
//  ViewController.swift
//  White&FluffyTestTask
//
//  Created by Liza Kostitsina on 30.08.2021.
//

import UIKit
import Alamofire

class StartScreenViewController: UIViewController {
    
    //MARK: - UI elements
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        return searchBar
    }()
    
    private lazy var cityListTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private lazy var navigationBar: CustomNavigationBar = {
        let navigationBar = CustomNavigationBar()
        return navigationBar
    }()

    //MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        makeConstraints()
        setupTableView()
       // NetworkMethods.parseJson(with: NetworkConstants.url!, completion:{})
    }
    
    //MARK: - Private methods
    
    private func addSubviews() {
        self.view.addSubview(searchBar)
        self.view.addSubview(cityListTableView)
        self.view.addSubview(navigationBar)
    }
    
    private func makeConstraints() {
        //MARK: - Navigation Bar constraints
        self.navigationBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: navigationBar, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: navigationBar, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: navigationBar, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: navigationBar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 70).isActive = true
        
        //MARK: - Search Bar constraints
        self.searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: searchBar, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: searchBar, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: -10).isActive = true
        NSLayoutConstraint(item: searchBar, attribute: .top, relatedBy: .equal, toItem: self.navigationBar, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: searchBar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40).isActive = true
        
        //MARK: - Table View constraints
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
}

extension StartScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityListTableViewCell.reuseIdentifier, for: indexPath) as! CityListTableViewCell
        return cell
    }
}

extension UITableViewCell {
    public static var reuseIdentifier: String {
        String(describing: self)
    }
}
