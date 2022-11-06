//
//  ContentView.swift
//  FireList
//
//  Created by Kishan Patel on 11/6/22.
//

import SwiftUI

//hi
struct ContentView: View {
    @ObservedObject private var vM = GroceryItemViewModel()
    
    @State private var name: String = ""
    @State private var priceAsString = ""    
    
    var body: some View {
        
        NavigationView {
            HStack {
                VStack{
                    Text("To Buy")
                    List(vM.toBuy) {contact in
                        VStack(alignment: .leading) {
                            Text(contact.name!)
                                .swipeActions {
                                    Button("Order") {
                                        print("Awesome!")
                                    }
                                    
                                }
                            }
                        }.onAppear() {
                            self.vM.fetchBuy()
                        
                    }
                }
                VStack {
                    Text("Bought")
                    
                    
                    List(vM.Bought) {contact in
                        VStack(alignment: .leading) {
                            Text(contact.name!)
                            Text("\(contact.price)")
                        }
                    }.onAppear() {
                        self.vM.fetchBought()
                    }
                }
//                Text("Price: ")
//                Text("\(total_price)")
            
            }
            
            .listStyle(.insetGrouped)
        }.navigationTitle("Groceries!")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        TextField("Enter Item Name", text: $name)
                        TextField("Enter Item Price", text:$priceAsString)
                        Button(action: {
                            self.vM.addData(name: name, price: Double(priceAsString)!)
                        }) {
                            HStack {
                                Image(systemName: "plus")
                                    .font(.title)
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(40)
                        }
                    }
                }
            }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
