//
//  item.swift
//  ToDoList
//
//  Created by Subash on 11/02/19.
//  Copyright © 2019 Subash. All rights reserved.
//

import Foundation

class item : Encodable,Decodable {
    var itemName:String = ""
    var done:Bool = false
}
