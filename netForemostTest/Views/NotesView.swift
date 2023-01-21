//
//  NotesView.swift
//  netForemostTest
//
//  Created by Guillermo Jimenez on 20/1/23.
//

import SwiftUI

fileprivate enum Destinations: Hashable {
    case new
    case edit(Note)
}

struct NotesView: View {
    @StateObject var noteViewModel = NoteViewModel()
    @State private var selection: Destinations?
    @State private var showFilters = false
    
    var body: some View {
        
        ScrollView {
            LazyVStack {
                ForEach($noteViewModel.notes) { $note in
                    NavigationLink(value: Destinations.edit(note)) {
                        NoteDetailView(note: $note)
                            .padding()
                    }
                    .buttonStyle(.plain)
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
                    showFilters = true
                }) {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                  }
            }
        }
        .navigationDestination(for: Destinations.self) { i in
            switch i {
            case .new:
                NoteView(noteViewModel: noteViewModel)
            case .edit(let note):
                NoteView(noteViewModel: noteViewModel, note: note)
            }
        }
    }
}
