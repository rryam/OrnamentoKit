//
//  OrnamentoNotificationModifier.swift
//  OrnamentoKit
//
//  Created by Rudrank Riyam on 28/02/24.
//

import SwiftUI

extension View {

  /// Adds a notification ornament to a view.
  ///
  /// This modifier attaches a `OrnamentoNotificationView` to the specified view, using the provided `OrnamentoNotificationModel`.
  ///
  /// Example:
  /// ```swift
  /// struct ContentView: View {
  ///     @StateObject private var notificationModel = NotificationOrnamentModel()
  ///
  ///     var body: some View {
  ///         SomeSpecificView()
  ///             .notification(for: notificationModel)
  ///     }
  /// }
  /// ```
  ///
  /// - Parameter model: The `OrnamentoNotificationModel` to use for the notification ornament.
  /// - Returns: A modified view with the attached notification ornament.
  public func ornamentNotification(for model: some OrnamentoNotificationProtocol) -> some View {
    self.modifier(OrnamentoNotificationModifier(model: model))
  }
}

public struct OrnamentoNotificationModifier<ViewModel: OrnamentoNotificationProtocol>: ViewModifier {
  @ObservedObject var model: ViewModel

  public func body(content: Content) -> some View {
    content
      .ornament(visibility: model.visibility, attachmentAnchor: .scene(.top), ornament: {
        OrnamentoNotificationView(model: model)
          .opacity(model.notification != nil ? 1.0 : 0.0)
          .glassBackgroundEffect()
      })
      .onChange(of: model.notification) {
        model.showNotification()
      }
  }
}
