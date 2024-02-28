//
//  OrnamentoNotification.swift
//  OrnamentoKit
//
//  Created by Rudrank Riyam on 28/02/24.
//

import Foundation

public struct OrnamentoNotification: Identifiable, Equatable {
  public var id = UUID()
  public var title: String
  public var message: String?
  public var type: OrnamentoNotificationType

  public init(id: UUID = UUID(), title: String, message: String? = nil, type: OrnamentoNotificationType) {
    self.id = id
    self.title = title
    self.message = message
    self.type = type
  }
}
