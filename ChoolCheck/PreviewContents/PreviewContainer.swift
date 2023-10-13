//
//  PreviewContainer.swift
//  ChoolCheck
//
//  Created by Eli_01 on 10/14/23.
//

import SwiftData

@MainActor
let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(
            for: Member.self, 
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        for member in SampleMember.contents {
            container.mainContext.insert(member)
        }
        return container
    } catch {
        fatalError("Failed to create container")
    }
}()
