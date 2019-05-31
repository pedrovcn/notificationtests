//
//  PDF.swift
//  notificationtests
//
//  Created by Pedro Vinicius Cuêlho do Nascimento on 29/05/2019.
//  Copyright © 2019 Pedro Nascimento. All rights reserved.
//

import Foundation
import ObjectMapper

struct PDF: Mappable {

    var name: String?
    var location: String?

    init(map: Map) { }

    mutating func mapping(map: Map) {
        name     <- map["name"]
        location <- map["location"]
    }
}
