//
//  User.swift
//  Tutorial3
//
//  Created by JungWoo Choi on 26/8/2024.
//

import Foundation

struct User: Codable {
  let id: String
  let fullName: String
  let email: String
  let joined: TimeInterval
}
