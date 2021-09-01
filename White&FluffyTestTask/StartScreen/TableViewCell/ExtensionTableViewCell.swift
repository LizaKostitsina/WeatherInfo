//
//  ExtensionTableViewCell.swift
//  White&FluffyTestTask
//
//  Created by Liza Kostitsina on 30.08.2021.
//

import UIKit

extension UITableViewCell {
    public static var reuseIdentifier: String {
        String(describing: self)
    }
}
