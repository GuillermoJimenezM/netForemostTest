//
//  Date.swift
//  netForemostTest
//
//  Created by Guillermo Jimenez on 20/1/23.
//

import Foundation

extension Date {
    
    func toLocalShortDate() -> String {
        let formater = DateFormatter()
        formater.dateFormat = "MMM d, yyyy"

        return formater.string(from: self)
    }
    
}
