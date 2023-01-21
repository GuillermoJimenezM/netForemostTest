//
//  NoteDetailView.swift
//  netForemostTest
//
//  Created by Guillermo Jimenez on 20/1/23.
//

import SwiftUI

struct NoteDetailView: View {
   
    @Binding var note: Note
    @State private var color = K.COLORS.randomElement()
    
    var body: some View {
        HStack {
        
            Text(note.title ?? "")
            
            Spacer()
            
            if let date = note.date {
                Text(date.toLocalShortDate())
            }
        }
        .padding(10)
        .background(color)
        .cornerRadius(10)
    }
    
  
}

