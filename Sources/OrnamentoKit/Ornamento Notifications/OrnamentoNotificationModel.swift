//
//  OrnamentoNotificationModel.swift
//  OrnamentoKit
//
//  Created by Rudrank Riyam on 28/02/24.
//

import SwiftUI

public final class OrnamentoNotificationModel: OrnamentoNotificationProtocol {
  @Published public var notification: OrnamentoNotification?
  @Published public var visibility: Visibility

  public var seconds: Int

  public init(notification: OrnamentoNotification? = nil, visibility: Visibility = .hidden, seconds: Int = 2) {
    self.notification = notification
    self.visibility = visibility
    self.seconds = seconds
  }

  public func showNotification() {
    if notification != nil {
      withAnimation(.easeInOut) {
        visibility = .visible
      }

      dismissNotification()
    }
  }

  public func dismissNotification() {
    Task {
      try await Task.sleep(nanoseconds: UInt64(seconds * 1_000_000_000))
      self.notification = nil
      visibility = .hidden
    }
  }
}
