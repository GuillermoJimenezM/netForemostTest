//
//  NoteView.swift
//  netForemostTest
//
//  Created by Guillermo Jimenez on 19/1/23.
//

import SwiftUI

struct NoteView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var noteViewModel: NoteViewModel
    
    @State private var titleText = ""
    @State private var bodyText = ""
    @State private var date = Date()
    
    var body: some View {
        
        VStack {
            VStack(alignment: .leading, spacing: 5) {
                
                DatePicker("date", selection: $date, displayedComponents: .date)
                    .pickerStyle(.menu)
                
                Text("title")
                
                TextField("", text: $titleText)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                
                TextEditor(text: $bodyText)
                    .padding()
                    .scrollContentBackground(.hidden) // <- Hide it
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                
                Button {
                    
                    let newNote = NoteModel(title: titleText, body: bodyText, date: date)
                    
                    do {
                        try noteViewModel.createNote(note: newNote)
                        print("saved")
                        dismiss()
                    }
                    catch {
                        print(error)
                    }
                } label: {
                    Text("save")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
            }
            .padding(.horizontal, 10)
        }
        .navigationTitle("note")
    }
}


