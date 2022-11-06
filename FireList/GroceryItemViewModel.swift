//
//  ContactViewModel.swift
//  FireList
//
//  Created by Kishan Patel on 11/6/22.
//

import SwiftUI
import Foundation
import FirebaseFirestore

class GroceryItemViewModel: ObservableObject {
    
    @Published var toBuy = [GroceryItem]()
    
    @Published var Bought = [GroceryItem]()
    

    
    
    private var db = Firestore.firestore()
    
    func fetchBuy() {
        db.collection("toBuy").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            
            self.toBuy = documents.map { (queryDocumentSnapshot) -> GroceryItem in
                let data = queryDocumentSnapshot.data()
                let name = data["name"] as? String ?? ""
                let price = data["price"] as? Double ?? 0
                return GroceryItem(name: name, price: price)
            }
        }
    }
    
    
    func fetchBought() {
        db.collection("Bought").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            
            self.Bought = documents.map { (queryDocumentSnapshot) -> GroceryItem in
                let data = queryDocumentSnapshot.data()
                let name = data["name"] as? String ?? ""
                let price = data["price"] as? Double ?? 0
                return GroceryItem(name: name, price: price)
            }
        }
    }
    
//    func getPrice() {
//        var total_price: Double = 0
//        for item in self.Bought {
//            total_price += item.price
//        }
//    }
    
    
    
    
    func addData(name: String, price: Double) {
        db.collection("toBuy").addDocument(data: ["name":name, "price": price])
        }
    
    func addBought(name: String, price: Double) {
        db.collection("Double").addDocument(data: ["name":name, "price": price])
    }
}
