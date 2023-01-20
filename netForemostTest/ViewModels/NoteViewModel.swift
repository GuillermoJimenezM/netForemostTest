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
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "Notes") //exactname of the CoreData file
        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
       // self.getStoredPosts()
    }
    
    func createNote(note: NoteModel) throws {
        
        let newNote = Note(context: container.viewContext)
        newNote.id = note.id
        newNote.title = note.title
        newNote.body = note.body
        newNote.date = note.date
        
       // do {
            try container.viewContext.save()
           // self.posts.append(newNote)
     //   } catch {
        //    print("Unresolved error \(error.localizedDescription)")
      //  }
    }
}
