//
//  ContentView.swift
//  ChoolCheck
//
//  Created by Eli_01 on 2023/10/13.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            AttendanceListScene()
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("출석부")
                }
            Text("22222")
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("출석체크")
                }
            Text("33333")
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("출석기록")
                }
        }
        .toolbar(content: {
            ToolbarItemGroup(placement: .automatic) {
                Text("출석부")
            }
        })
    }
}

#Preview {
    ContentView()
        .modelContainer(previewContainer)
}
