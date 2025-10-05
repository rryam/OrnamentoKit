//
//  OrnamentoNotificationView.swift
//  OrnamentoKit
//
//  Created by Rudrank Riyam on 28/02/24.
//

import Observation
import SwiftUI

@available(macOS 14.0, *)
struct OrnamentoNotificationView<ViewModel: OrnamentoNotificationProtocol>: View {
  @Bindable var model: ViewModel

  init(model: ViewModel) {
    self.model = model
  }

  var body: some View {
    Group {
      if let notification = model.notification {
        OrnamentoNotificationItem(notification: notification)
      }
    }
    .padding()
    .padding(.horizontal)
  }
}

@available(macOS 14.0, *)
struct OrnamentoNotificationItem: View {
  var notification: OrnamentoNotification

  var body: some View {
    HStack {
      Image(systemName: notification.type.icon)
        .foregroundStyle(notification.type.color)

      VStack(alignment: .leading) {
        Text(notification.title)
          .font(.headline)
          .foregroundColor(.primary)

        if let message = notification.message {
          Text(message)
            .font(.subheadline)
            .foregroundColor(.secondary)
        }
      }

      Spacer()
    }
  }
}
