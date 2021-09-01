//
//  PartsOfTheDayTempretureModel.swift
//  White&FluffyTestTask
//
//  Created by Liza Kostitsina on 31.08.2021.
//

import Foundation

struct PartsOfTheDayTempretureModel {
    let tempretures: [PartOfTheDay : Int]
}

enum PartOfTheDay {
    case morning
    case day
    case evening
    case night
}
