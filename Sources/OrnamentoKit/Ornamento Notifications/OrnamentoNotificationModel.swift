//
//  OrnamentoNotificationModel.swift
//  OrnamentoKit
//
//  Created by Rudrank Riyam on 28/02/24.
//

import Observation
import SwiftUI

@available(macOS 14.0, *)
@Observable
@MainActor
public final class OrnamentoNotificationModel: OrnamentoNotificationProtocol {
  public var notification: OrnamentoNotification?
  public var visibility: Visibility

  public var seconds: Int
  @ObservationIgnored private var dismissalTask: Task<Void, Never>?

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
    let notificationID = notification?.id
    let seconds = UInt64(clamping: seconds)
    let nanoseconds = min(seconds, UInt64.max / 1_000_000_000) * 1_000_000_000

    dismissalTask?.cancel()
    dismissalTask = Task { @MainActor [weak self, notificationID, nanoseconds] in
      do {
        try await Task.sleep(nanoseconds: nanoseconds)
      } catch {
        return
      }

      guard let self, !Task.isCancelled, notification?.id == notificationID else {
        return
      }

      notification = nil
      visibility = .hidden
      dismissalTask = nil
    }
  }
}
