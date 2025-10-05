//
//  OrnamentoNotificationType.swift
//  OrnamentoKit
//
//  Created by Rudrank Riyam on 28/02/24.
//

import SwiftUI

public enum OrnamentoNotificationType {
  case error
  case warning
  case success
  case info
}

@available(macOS 10.15, *)
extension OrnamentoNotificationType {
  public var color: Color {
    switch self {
      case .error: return Color.red
      case .warning: return Color.orange
      case .info: return Color.blue
      case .success: return Color.green
    }
  }

  public var icon: String {
    switch self {
      case .info: return "info.circle.fill"
      case .warning: return "exclamationmark.triangle.fill"
      case .success: return "checkmark.circle.fill"
      case .error: return "xmark.circle.fill"
    }
  }
}
