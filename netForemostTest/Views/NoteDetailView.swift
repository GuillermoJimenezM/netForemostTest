//
//  NoteDetailView.swift
//  netForemostTest
//
//  Created by Guillermo Jimenez on 20/1/23.
//

import SwiftUI

struct NoteDetailView: View {
    let colors: [Color] = [.yellow, .green, .mint, .teal, .gray.opacity(0.2)]
    @Binding var note: Note
    
    var body: some View {
        HStack {
        
            Text(note.title ?? "")
            
            Spacer()
            
            if let date = note.date {
                Text(date.toLocalShortDate())
            }
            
        }
        .padding(10)
        .background(colors.randomElement())
        .cornerRadius(25)
    }
    
  
}

