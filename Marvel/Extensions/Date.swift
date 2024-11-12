//
//  Date.swift
//  Marvel
//
//  Created by apple on 12/11/2024.
//

import Foundation

extension Date {
    var timestamp: Double {
        timeIntervalSince1970 * 1000.0
    }
}
