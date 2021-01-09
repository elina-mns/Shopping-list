//
//  CheckoutBasket.swift
//  Shopping list
//
//  Created by Elina Mansurova on 2021-01-08.
//

import Foundation

struct CheckoutBasket: Encodable {
    let items: [CheckoutItem]
    let total: Int
}
