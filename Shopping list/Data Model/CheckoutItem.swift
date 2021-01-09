//
//  CheckoutItem.swift
//  Shopping list
//
//  Created by Elina Mansurova on 2021-01-08.
//

import Foundation

struct CheckoutItem: Encodable {
    let item: ItemModel
    var count: Int
}
