//
//  Contact.swift
//  FireList
//
//  Created by Kishan Patel on 11/6/22.
//

import Foundation
import SwiftUI

struct GroceryItem: Codable, Identifiable {
    var id: String = UUID().uuidString
    var name: String?
    var price: Double

}
