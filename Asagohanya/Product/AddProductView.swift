//
//  AddProductView.swift
//  Asagohanya
//
//  Created by 王冠之 on 2020/10/20.
//

import SwiftUI

struct AddProductView: View {
    @Environment(\.managedObjectContext) var context
    @Environment(\.presentationMode) var presentationMode
    @State var name: String = ""
    @State var price: String = ""
    @State var isFailed = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Product name：")
                TextField("Input product name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            
            HStack {
                Text("Price：")
                TextField("Input price", text: $price)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
            }
            .padding()
            
            Button(
                action: {print("on add clicked")
                    let isSuccessful = self.addProduct()
                    self.isFailed = !isSuccessful
                    if isSuccessful {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
                , label: { Text("Add") })
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("ButtonColor")) //背景顏色
                .foregroundColor(Color.white)  //前景顏色，也就是字的顏色
                .cornerRadius(30) //round border 為 30
                .font(.headline)  //字體樣式
                .padding()
                //padding 可以在元件的上下左右置入邊距，保留一點空白空間。
                .alert(isPresented: $isFailed, content: {
                    Alert(title: Text("Input data is incorrect."),
                          message: Text("Check again!"),
                          dismissButton: .default(Text("ok")))
                })
                .navigationBarTitle("Add a product")
            Spacer()
        }
    }
    
    private func addProduct() -> Bool{
        guard !name.isEmpty else {return false}
        guard let parsedPrice = Double(price) else {return false}
        let product = Product(context: context)
        product.id = UUID()
        product.name = name
        product.price = parsedPrice
        do {
            try context.save()
            return true
        } catch {
            print("\(error)")
            return false
        }
    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView()
    }
}
