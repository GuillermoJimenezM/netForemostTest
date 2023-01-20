//
//  Note.swift
//  netForemostTest
//
//  Created by Guillermo Jimenez on 19/1/23.
//

import Foundation

struct NoteModel {
    
    let id: UUID
    var title: String
    var body: String
    var date: Date
    
    init(title: String, body: String, date: Date) {
        self.id = UUID()
        self.title = title
        self.body = body
        self.date = date
    }
}
