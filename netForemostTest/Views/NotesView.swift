//
//  NotesView.swift
//  netForemostTest
//
//  Created by Guillermo Jimenez on 20/1/23.
//

import SwiftUI

private enum Destinations: Hashable {
    case new
    case edit(UUID)
}

struct NotesView: View {
    @StateObject var noteViewModel = NoteViewModel()
    @State private var selection: Destinations?
    
    var body: some View {
        
        ScrollView {
            LazyVStack {
                ForEach($noteViewModel.notes) { $note in
                    NoteDetailView(note: $note)
                        .padding()
                }
                
            }
        }
        .navigationTitle("notes")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(value: Destinations.new) {
                    Image(systemName: "plus.circle")
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                }) {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                  }
                
            }
        }
        .navigationDestination(for: Destinations.self) { i in
            NoteView(noteViewModel: noteViewModel)
        }
        
    }
}
