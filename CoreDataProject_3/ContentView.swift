//
//  ContentView.swift
//  CoreDataProject_3
//
//  Created by Subhrajyoti Chakraborty on 05/08/20.
//  Copyright © 2020 Subhrajyoti Chakraborty. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var selectedSection = "A"
    
    var body: some View {
        VStack {
            // List will be here
            FilteredList(filter: selectedSection, filterKey: "section") {(student: Student) in
                Text("\(student.wrappedName) \(student.wrappedSection)")
            }
            
            Button("Add") {
                let studentOne = Student(context: self.moc)
                studentOne.name = "Subha 1"
                studentOne.section = "A"
                
                let studentTwo = Student(context: self.moc)
                studentTwo.name = "Subha 2"
                studentTwo.section = "B"
                
                try? self.moc.save()
            }
            
            Button("Show Section A") {
                self.selectedSection = "A"
            }
            
            Button("Show Section B") {
                self.selectedSection = "B"
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
