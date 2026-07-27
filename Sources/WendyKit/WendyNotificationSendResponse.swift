import Foundation

/// The outcome of sending a notification through WendyOS.
public struct WendyNotificationSendResponse: Sendable, Hashable {
  /// The canonical caller-generated Notification UUID v4 accepted by Wendy.
  public let notificationID: UUID

  /// The unique recipients resolved by Wendy Cloud, capped at 10,000.
  public let recipientCount: Int

  public init(notificationID: UUID, recipientCount: Int) throws {
    guard isNotificationUUIDv4(notificationID) else {
      throw WendyError.invalidRequest("notification_id must be a UUID v4")
    }

    self.notificationID = notificationID
    self.recipientCount = recipientCount
  }
}
