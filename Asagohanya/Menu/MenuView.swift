//
//  MenuView.swift
//  Asagohanya
//
//  Created by 王冠之 on 2020/10/21.
//

import SwiftUI

struct MenuView: View {
    @FetchRequest(entity: Product.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \Product.name, ascending: false)])
    var products: FetchedResults<Product>
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Image("MenuBackground")
                    .resizable()
                List {
                    ForEach(self.products, id: \.id) {
                        product in
                        MenuRowView(product: product)
                    }
                }
                .frame(width: proxy.size.width * 0.75, height: proxy.size.height)
            }
            .frame(width: proxy.size.width, height: proxy.size.height, alignment: .topLeading)
        }
        .navigationBarTitle("Menu")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
