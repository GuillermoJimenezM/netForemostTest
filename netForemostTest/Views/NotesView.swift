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
    @State private var showFilters = false
    
    var body: some View {
        
        ScrollView {
            LazyVStack {
                ForEach($noteViewModel.notes) { $note in
                    NoteDetailView(note: $note)
                        .padding()
                }
            }
        }
        .sheet(isPresented: $showFilters) {
            NotesFilterView(noteViewModel: noteViewModel)
                .padding(.horizontal)
                .presentationDetents([.height(200)])
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
                    print(showFilters)
                    showFilters = true
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
