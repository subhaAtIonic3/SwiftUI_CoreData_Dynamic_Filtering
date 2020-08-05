//
//  FilteredList.swift
//  CoreDataProject_3
//
//  Created by Subhrajyoti Chakraborty on 06/08/20.
//  Copyright © 2020 Subhrajyoti Chakraborty. All rights reserved.
//

import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {
    
    var fetchRequest: FetchRequest<T>
    var students: FetchedResults<T> { fetchRequest.wrappedValue }
    let content: (T) -> Content
    
    init(filter: String, filterKey: String, @ViewBuilder content: @escaping (T) -> Content) {
        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filter))
        
        self.content = content
    }
    
    var body: some View {
        List {
            ForEach(fetchRequest.wrappedValue, id: \.self) {student in
                self.content(student)
            }
        }
    }
}

