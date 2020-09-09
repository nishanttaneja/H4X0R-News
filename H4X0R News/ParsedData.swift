//
//  ParsedData.swift
//  H4X0R News
//
//  Created by Nishant Taneja on 09/09/20.
//  Copyright © 2020 Nishant Taneja. All rights reserved.
//

import Foundation

struct ParsedData: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable{
    var id: String {return objectID}
    let title: String
    let url: String
    let author: String
    let points: Int
    let num_comments: Int
    let created_at_i: Int
    let objectID: String
}
