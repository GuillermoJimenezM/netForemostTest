//
//  ContentView.swift
//  netForemostTest
//
//  Created by Guillermo Jimenez on 19/1/23.
//

import SwiftUI

private enum Destinations: Hashable {
    case new
    case edit(UUID)
}

struct ContentView: View {
    @StateObject var noteViewModel = NoteViewModel()
    @State private var selection: Destinations?
    
    var body: some View {
        NavigationStack {
            
            List {
                Text("HELLO1")
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(value: Destinations.new) {
                        Image(systemName: "plus.circle")
                    }
                }
            }
            .navigationDestination(for: Destinations.self) { i in
                NoteView(noteViewModel: noteViewModel)
            }
        }
    }
}
