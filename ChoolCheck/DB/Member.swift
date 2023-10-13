//
//  Member.swift
//  ChoolCheck
//
//  Created by Eli_01 on 2023/10/14.
//

import Foundation
import SwiftData

@Model
final class Member {
    @Attribute(.unique) var id: UUID
    var nickName: String
    var name: String?
    var joinDate: Date
    var birthDate: Date?
    var attendanceDate: [Date]

    init(
        id: UUID,
        nickName: String,
        name: String?,
        joinDate: Date,
        birthDate: Date?,
        attendanceDate: [Date]
    ) {
        self.id = id
        self.nickName = nickName
        self.name = name
        self.joinDate = joinDate
        self.birthDate = birthDate
        self.attendanceDate = attendanceDate
    }
}
