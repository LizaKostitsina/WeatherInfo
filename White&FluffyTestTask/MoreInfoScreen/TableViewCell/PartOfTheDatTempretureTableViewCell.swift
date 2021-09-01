//
//  PartOfTheDatTempretureTableViewCell.swift
//  White&FluffyTestTask
//
//  Created by Liza Kostitsina on 31.08.2021.
//

import UIKit

class PartOfTheDatTempretureTableViewCell: UITableViewCell {

    //MARK: - UI elements
    
    lazy var partOfTheDayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Georgia", size: 20)
        return label
    }()
    
    lazy var tempretureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Georgia", size: 20)
        return label
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
        self.contentView.addSubview(partOfTheDayLabel)
        self.contentView.addSubview(tempretureLabel)
    }
    
    private func makeConstraints(){
        //MARK: - partOfTheDayLabel constraints
        self.partOfTheDayLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: partOfTheDayLabel, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: partOfTheDayLabel, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: partOfTheDayLabel, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1, constant: -10).isActive = true
        
        //MARK: - tempretureLabel constraints
        self.tempretureLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: tempretureLabel, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1, constant: -20).isActive = true
        NSLayoutConstraint(item: tempretureLabel, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: tempretureLabel, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1, constant: -10).isActive = true
    }
}
