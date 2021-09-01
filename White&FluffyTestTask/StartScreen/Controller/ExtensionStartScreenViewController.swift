//
//  ExtensionStartScreenViewController.swift
//  White&FluffyTestTask
//
//  Created by Liza Kostitsina on 30.08.2021.
//

import UIKit
// MARK: - UITableViewDelegate, UITableViewDataSource implementation

extension StartScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityListTableViewCell.reuseIdentifier, for: indexPath) as! CityListTableViewCell
        let weather = self.filteredArray[indexPath.row]
        DispatchQueue.main.async{
            cell.cityNameLabel.text = weather.cityName
            cell.currentTempretureLabel.text = String(weather.currentTempreture) + "°C"
            var image = UIImage()
            switch weather.condition {
            case .clear: image = UIImage(named: "clearIcon")!
            case .cloudy: image = UIImage(named: "cloudyIcon")!
            case .lightRain: image = UIImage(named: "lightRainIcon")!
            case .overcast: image = UIImage(named: "overcastIcon")!
            case .partlyCloudy: image = UIImage(named: "cloudyIcon")!
            case .rain: image = UIImage(named: "heavyRainIcon")!
            }
            cell.currentWeatherImageView.image = image
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(70)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let weather = self.filteredArray[indexPath.row]
        let moreInfoViewController = MoreInfoViewController()
        moreInfoViewController.cityNameLabel.text = weather.cityName
        moreInfoViewController.partsOfTheDayTempreture = weather.partsOfTheDayTempreture.tempretures
        self.navigationController?.pushViewController(moreInfoViewController, animated: false)
        self.navigationBar.removeFromSuperview()
    }
}

// MARK: - UISearchBarDelegate implementation

extension StartScreenViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredArray = self.weatherArray.filter { [weak self] in
            if $0.cityName.lowercased() == searchText.lowercased() {
                let moreInfoViewController = MoreInfoViewController()
                moreInfoViewController.cityNameLabel.text = $0.cityName
                moreInfoViewController.partsOfTheDayTempreture = $0.partsOfTheDayTempreture.tempretures
                self?.navigationController?.pushViewController(moreInfoViewController, animated: false)
                self?.navigationBar.removeFromSuperview()
            }
            return $0.cityName.lowercased().contains(searchText.lowercased())
        }
        if searchText == "" {
            filteredArray = self.weatherArray
        }
        self.cityListTableView.reloadData()
    }
}
