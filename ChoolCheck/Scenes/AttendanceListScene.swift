//
//  AttendanceListScene.swift
//  ChoolCheck
//
//  Created by Eli_01 on 2023/10/14.
//

import SwiftUI
import SwiftData

struct AttendanceListScene: View {
    @Environment (\.modelContext) private var modelContext
    @Query private var members: [Member]

    var body: some View {
        NavigationView {
            List {
                ForEach(members) { member in
                    HStack {
                        Text(member.nickName)
                        Text("\(member.joinDate)")
                        Text(member.name ?? "")
                    }
                }
                .onDelete(perform: delete)
            }
            .navigationBarTitle("출석부")
        }
    }

    func delete(set: IndexSet) {
        for index in set {
            self.modelContext.delete(self.members[index])
        }
    }
}

#Preview {
    AttendanceListScene()
        .modelContainer(previewContainer)
}
