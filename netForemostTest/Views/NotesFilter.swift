//
//  NotesFilter.swift
//  netForemostTest
//
//  Created by Guillermo Jimenez on 20/1/23.
//

import SwiftUI

struct NotesFilter: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var noteViewModel: NoteViewModel
    
    var body: some View {
        VStack {
            
            Button {
                
            } label: {
                Text("save")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            
            Button {
                
            } label: {
                Text("save")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            
        }
    }
}

