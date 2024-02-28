//
//  OrnamentoNotificationView.swift
//  OrnamentoKit
//
//  Created by Rudrank Riyam on 28/02/24.
//

import SwiftUI

struct OrnamentoNotificationView<ViewModel: OrnamentoNotificationProtocol>: View {
  @ObservedObject var model: ViewModel

  var body: some View {
    Group {
      if let notification = model.notification {
        OrnamentoNotificationItem(notification: notification)
      }
    }
    .padding()
    .padding(.horizontal)
    .opacity(model.notification != nil ? 1.0 : 0.0)
    .glassBackgroundEffect()
  }
}

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
