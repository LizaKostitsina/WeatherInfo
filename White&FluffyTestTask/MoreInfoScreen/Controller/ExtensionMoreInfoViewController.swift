//
//  ExtensionMoreInfoViewController.swift
//  White&FluffyTestTask
//
//  Created by Liza Kostitsina on 31.08.2021.
//

import UIKit

extension MoreInfoViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PartOfTheDatTempretureTableViewCell.reuseIdentifier, for: indexPath) as! PartOfTheDatTempretureTableViewCell
        var partOfTheDay = ""
        var tempreture = ""
        guard let partsOfTheTemp = self.partsOfTheDayTempreture else { return UITableViewCell() }
        switch indexPath.row {
        case 0:
            partOfTheDay = "Утро"
            tempreture = String(partsOfTheTemp[.morning] ?? 0)
        case 1:
            partOfTheDay = "День"
            tempreture = String(partsOfTheTemp[.day] ?? 0)
        case 2:
            partOfTheDay = "Вечер"
            tempreture = String(partsOfTheTemp[.evening] ?? 0)
        case 3:
            partOfTheDay = "Ночь"
            tempreture = String(partsOfTheTemp[.night] ?? 0) 
            
        default: break
        }
        cell.partOfTheDayLabel.text = partOfTheDay
        cell.tempretureLabel.text = tempreture + "°C"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(70)
    }
}
