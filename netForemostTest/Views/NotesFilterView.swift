//
//  NotesFilter.swift
//  netForemostTest
//
//  Created by Guillermo Jimenez on 20/1/23.
//

import SwiftUI

struct NotesFilterView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var noteViewModel: NoteViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Button {
                    noteViewModel.filterNotes(filter: .title)
                } label: {
                    Text("orderByTitle")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                
                Button {
                    noteViewModel.filterNotes(filter: .date)
                } label: {
                    Text("orderByDate")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Text("ok")
                            .frame(maxWidth: .infinity)
                    }
                }
            }
        }
    }
}

