//
//  NotificationController.swift
//  PawsomeWatch Extension
//
//  Created by NIKHIL on 2020-08-24.
//  Copyright © 2020 User. All rights reserved.
//


import WatchKit
import Foundation
import UserNotifications


class NotificationController: WKUserNotificationInterfaceController {
  
  
  @IBOutlet var label: WKInterfaceLabel!
  @IBOutlet var image: WKInterfaceImage!
  
  
  override func didReceive(_ notification: UNNotification, withCompletion completionHandler: @escaping (WKUserNotificationInterfaceType) -> Void) {
    
    
    let notificationBody = notification.request.content.body
    label.setText(notificationBody)
    
    
    if let imageAttachment = notification.request.content.attachments.first {
      let imageURL = imageAttachment.url
      let imageData = try! Data(contentsOf: imageURL)
      let newImage = UIImage(data: imageData)
      image.setImage(newImage)
    } else {
      let catImageName = String(format: "cat%02d",
                                arguments: [Int.randomInt(1, max: 20)])
      image.setImageNamed(catImageName)
    }
    
    
    completionHandler(.custom)
  }
}
