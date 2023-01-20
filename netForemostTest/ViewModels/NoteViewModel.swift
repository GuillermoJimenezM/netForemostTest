//
//  NoteViewModel.swift
//  netForemostTest
//
//  Created by Guillermo Jimenez on 19/1/23.
//

import Foundation
import SwiftUI
import CoreData

@MainActor
final class NoteViewModel: ObservableObject {
    @Published var notes: [Note] = []
    var allNotes: [Note] = []
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "Notes") //exactname of the CoreData file
        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
        getStoredNotes()
    }
    
    func createNote(note: NoteModel) throws {
        
        let newNote = Note(context: container.viewContext)
        newNote.id = note.id
        newNote.title = note.title
        newNote.body = note.body
        newNote.date = note.date
        
        try container.viewContext.save()
    }
    
    func getStoredNotes() {
        let request = NSFetchRequest<Note>(entityName: "Note")
        
        do {
            let savedData = try container.viewContext.fetch(request)
            self.notes = savedData
            
        } catch {
            print("Error getting data. \(error.localizedDescription)")
        }
    }
}
