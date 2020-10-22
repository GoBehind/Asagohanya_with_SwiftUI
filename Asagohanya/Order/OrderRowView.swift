//
//  OrderRowView.swift
//  Asagohanya
//
//  Created by 王冠之 on 2020/10/22.
//

import SwiftUI

struct OrderRowView: View {
    let order: Order
    let onIncrement: (Order) -> Void
    let onDecrement: (Order) -> Void

    var body: some View {
        Stepper(onIncrement: {self.onIncrement(self.order)},
                onDecrement: {self.onDecrement(self.order)}
        ) {
            HStack {
                Text(order.name)
                    .font(.custom("Georgia", size: 20))
                Spacer()
                Text(String(format: "$ %.2f", order.price))
                    .font(.custom("Georgia", size: 20))
                Text(String(format: "%d", order.quantity))
                    .frame(minWidth: 44)
            }
        }
        .frame(height: 44)
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
    }
}

struct OrderRowView_Previews: PreviewProvider {
    private static var order: Order {
        Order(id: UUID(), name: "Americano", price: 25, quantity: 1)
    }

    static var previews: some View {
        OrderRowView(order: order, onIncrement: { _ in }, onDecrement: { _ in })
    }
}
