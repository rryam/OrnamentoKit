//
//  OrnamentoNotificationProtocol.swift
//  OrnamentoKit
//
//  Created by Rudrank Riyam on 28/02/24.
//

import SwiftUI

public protocol OrnamentoNotificationProtocol: ObservableObject {
  var notification: OrnamentoNotification? { get set }
  var visibility: Visibility { get set}
  var seconds: Int { get set }

  func showNotification()
  func dismissNotification()
}
