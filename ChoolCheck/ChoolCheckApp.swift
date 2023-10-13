//
//  ChoolCheckApp.swift
//  ChoolCheck
//
//  Created by Eli_01 on 2023/10/13.
//

import SwiftUI

@main
struct ChoolCheckApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Member.self)
    }
}
