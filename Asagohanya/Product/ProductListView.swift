//
//  ProductListView.swift
//  Asagohanya
//
//  Created by 王冠之 on 2020/10/20.
//

import SwiftUI

struct ProductListView: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: Product.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Product.name, ascending: false)])
    var products: FetchedResults<Product>
    
    var body: some View {
        List {
            ForEach(products, id: \.id) { product in
                NavigationLink(destination: EditProductView(product: product)) {
                    ProductRowView(product: product)
                }
            }
            .onDelete(perform: delete)
            //List 已經支援向左滑動手勢。我們只要在 ForEach() 下呼叫.onDelete(perform:)，就可以了。
        }
        .navigationBarTitle("Product List")
        .navigationBarItems(trailing: NavigationLink(destination: AddProductView()) {
            Image(systemName: "plus")
        })
    }
    
    private func delete(at offsets: IndexSet) {
        for index in offsets {
            context.delete(products[index])
        }
        do {
            try context.save()
        } catch {
            print("\(error)")
        }
    }
}

struct ProductList_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
