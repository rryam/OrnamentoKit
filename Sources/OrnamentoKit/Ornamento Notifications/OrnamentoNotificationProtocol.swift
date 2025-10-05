//
//  OrnamentoNotificationProtocol.swift
//  OrnamentoKit
//
//  Created by Rudrank Riyam on 28/02/24.
//

import Observation
import SwiftUI

@available(macOS 14.0, *)
@MainActor
public protocol OrnamentoNotificationProtocol: AnyObject, Observable {
  var notification: OrnamentoNotification? { get set }
  var visibility: Visibility { get set}
  var seconds: Int { get set }

  func showNotification()
  func dismissNotification()
}
