//
//  Order.swift
//  Asagohanya
//
//  Created by 王冠之 on 2020/10/22.
//

import Foundation

struct Order {
    let id: UUID
    let name: String
    let price: Double

    var quantity: Int

    func increased() -> Order {
        var copy = self
        copy.quantity += 1
        return copy
    }

    func decreased() -> Order? {
        guard quantity > 1 else {return nil}
        var copy = self
        copy.quantity -= 1
        return copy
    }
}
