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
    
    static let cola = ItemModel(name: "Cola", price: 5, image: UIImage(named: "cola.png"))
    static let fries = ItemModel(name: "Fries", price: 10, image: UIImage(named: "fries.png"))
    static let sushi = ItemModel(name: "Sushi", price: 30, image: UIImage(named: "sushi.png"))
    static let bento = ItemModel(name: "Bento", price: 50, image: UIImage(named: "bento.png"))
    static let apple = ItemModel(name: "Apple", price: 5, image: UIImage(named: "apple.png"))
    static let burger = ItemModel(name: "Burger", price: 20, image: UIImage(named: "burger.png"))
    static let coffee = ItemModel(name: "Coffee", price: 20, image: UIImage(named: "coffee.png"))
}
