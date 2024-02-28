//
//  OrnamentoNotificationModel.swift
//  OrnamentoKit
//
//  Created by Rudrank Riyam on 28/02/24.
//

import SwiftUI

final class OrnamentoNotificationModel: OrnamentoNotificationProtocol {
  @Published var notification: OrnamentoNotification?
  @Published var visibility: Visibility = .hidden

  var seconds: Int = 2

  func showNotification() {
    if notification != nil {
      withAnimation(.easeInOut) {
        visibility = .visible
      }

      dismissNotification()
    }
  }

  internal func dismissNotification() {
    Task {
      try await Task.sleep(nanoseconds: UInt64(seconds * 1_000_000_000))
      self.notification = nil
      visibility = .hidden
    }
  }
}
