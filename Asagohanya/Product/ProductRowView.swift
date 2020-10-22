//
//  ProductRowView.swift
//  Asagohanya
//
//  Created by 王冠之 on 2020/10/21.
//

import SwiftUI

struct ProductRowView: View {
    let product: Product
    
    var body: some View {
        HStack {
            Text(product.name ?? "")
                .font(.custom("Georgia", size: 20))
            Spacer()
            Text(String(format: "$ %.2f", product.price))
                .font(.custom("Georgia", size: 20))
        }
        .frame(height: 44)
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
    }
}

struct ProductRowView_Previews: PreviewProvider {
    private static var product: Product {
        let product = Product()
        product.id = UUID()
        product.name = "Americano"
        product.price = 25
        return product
    }
    
    static var previews: some View {
        ProductRowView(product: product)
    }
}
