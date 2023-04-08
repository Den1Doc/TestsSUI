//
//  PushBootcamp.swift
//  TextSUI
//
//  Created by Денис Мишин on 07.04.2023.
//

import SwiftUI
import UserNotifications
import CoreLocation

class PushManager {
    static let instance = PushManager()
    
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("\(error)")
            } else {
                print("Hello")
            }
        }
    }
    
    func schedulePush() {
        let content = UNMutableNotificationContent()
        content.title = "Hello"
        content.subtitle = "soo easy"
        content.sound = .default
        content.badge = 1
        
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
//        var dateComponents = DateComponents()
//        dateComponents.hour = 20
//        dateComponents.minute = 26
//        dateComponents.weekday = 6
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let coordinates = CLLocationCoordinate2D(
            latitude: 40.00,
            longitude: 50.00)
        
        let region = CLCircularRegion(
            center: coordinates,
            radius: 100,
            identifier: UUID().uuidString)
        region.notifyOnEntry = true
        region.notifyOnExit = false
        
        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelPuch() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
    
}

struct PushBootcamp: View {
    var body: some View {
        
        VStack(spacing: 40.0) {
            Button("Request permission") {
                PushManager.instance.requestAuthorization()
            }
            Button("Request time") {
                PushManager.instance.schedulePush()
            }
        }
        
    }
}

struct PushBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PushBootcamp()
    }
}
