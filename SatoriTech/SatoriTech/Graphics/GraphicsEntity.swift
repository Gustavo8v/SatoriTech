//
//  GraphicsEntity.swift
//  SatoriTech
//
//  Created by Gustavo Gutierrez on 06/08/22.
//

import Foundation

struct GraphicsEntity: Codable {
    var security: [InfoStore] = []
    var cleaning: [InfoStore] = []
}

struct InfoStore: Codable {
    var name: String? = nil
    var value: Int? = nil
}

enum TypeChart: Int {
    case security = 0
    case cleaning
}
