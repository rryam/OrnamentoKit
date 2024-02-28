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
}
