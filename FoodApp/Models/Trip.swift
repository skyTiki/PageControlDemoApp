//
//  Trip.swift
//  FoodApp
//
//  Created by 市毛隆俊 on 2021/07/31.
//

import SwiftUI

struct Trip: Identifiable, Hashable {
    var id = UUID().uuidString
    var image: String
    var title: String
}

var trips = [
    Trip(image: "bigsur", title: "Big sur"),
    Trip(image: "catalina", title: "Catalina"),
    Trip(image: "sierra", title: "Sierra"),
    Trip(image: "ocean", title: "Ocean"),
    Trip(image: "hills", title: "Hills")
]
