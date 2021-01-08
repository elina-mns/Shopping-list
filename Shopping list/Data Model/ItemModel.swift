//
//  ItemModel.swift
//  Shopping list
//
//  Created by Elina Mansurova on 2021-01-07.
//

import UIKit

struct ItemModel: Hashable {
    let name: String
    let price: Int
    let image: UIImage?
    
    static let cola = ItemModel(name: "Cola", price: 20, image: UIImage(named: "cola.png"))
    static let fries = ItemModel(name: "Fries", price: 10, image: UIImage(named: "fries.png"))
    static let sushi = ItemModel(name: "Sushi", price: 50, image: UIImage(named: "sushi.png"))
}
