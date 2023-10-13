//
//  SampleMember.swift
//  ChoolCheck
//
//  Created by Eli_01 on 10/14/23.
//

import Foundation

struct SampleMember {
    static var contents: [Member] = [
        Member(id: UUID(), nickName: "김문옥", name: nil, joinDate: .now-1000, birthDate: nil, attendanceDate: []),
        Member(id: UUID(), nickName: "미니", name: "김민희", joinDate: .now-10, birthDate: nil, attendanceDate: [])
    ]
}
