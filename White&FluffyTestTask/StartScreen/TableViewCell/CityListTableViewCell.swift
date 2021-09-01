//
//  CityListTableViewCell.swift
//  White&FluffyTestTask
//
//  Created by Liza Kostitsina on 30.08.2021.
//

import UIKit

class CityListTableViewCell: UITableViewCell {
    
    //MARK: - UI elements
    
    lazy var cityNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Georgia", size: 20)
        return label
    }()
    
    lazy var currentTempretureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Georgia", size: 20)
        return label
    }()
    
    lazy var currentWeatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    //MARK: - Lifecycle methods

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        self.addSubviews()
        self.makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private methods
    
    private func addSubviews() {
        self.contentView.addSubview(cityNameLabel)
        self.contentView.addSubview(currentTempretureLabel)
        self.contentView.addSubview(currentWeatherImageView)
    }
    
    private func makeConstraints() {
        
        //MARK: - cityNameLabel constraints
        self.cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: cityNameLabel, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: cityNameLabel, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: cityNameLabel, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1, constant: -10).isActive = true
        
        //MARK: - currentTempretureLabel constraints
        self.currentTempretureLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: currentTempretureLabel, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1, constant: -20).isActive = true
        NSLayoutConstraint(item: currentTempretureLabel, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: currentTempretureLabel, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1, constant: -10).isActive = true
        
        //MARK: - currentWeatherImageView constraints
        self.currentWeatherImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: currentWeatherImageView, attribute: .trailing, relatedBy: .equal, toItem: self.currentTempretureLabel, attribute: .leading, multiplier: 1, constant: -5).isActive = true
        NSLayoutConstraint(item: currentWeatherImageView, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: currentWeatherImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40).isActive = true
        NSLayoutConstraint(item: currentWeatherImageView, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1, constant: -10).isActive = true
    }
}
