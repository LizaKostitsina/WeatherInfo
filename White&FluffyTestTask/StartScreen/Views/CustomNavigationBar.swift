//
//  CustomNavigationBar.swift
//  White&FluffyTestTask
//
//  Created by Liza Kostitsina on 30.08.2021.
//

import UIKit

class CustomNavigationBar: UINavigationBar {
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont(name: "Georgia", size: 20)
        titleLabel.textColor = UIColor.black
        titleLabel.text = "Weather Info"
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    //MARK: - Lifecycle methods
    init() {
        super.init(frame: .zero)
        self.backgroundColor = UIColor.lightGray
        self.addSubviews()
        self.makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private methods
    
    private func addSubviews() {
        self.addSubview(titleLabel)
    }
    
    private func makeConstraints() {
        //MARK: - Title Label constraints
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 30).isActive = true
        NSLayoutConstraint(item: titleLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -30).isActive = true
        NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 25).isActive = true
    }
}
