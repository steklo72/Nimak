//
//  NimakApp.swift
//  Nimak
//
//  Created by Fedotov Aleksandr on 10.05.2024.
//

import SwiftUI
import Firebase
import FirebaseCore


@main
struct NimakApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
        CategoryList()
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }
    func applicationWillResignActive(_ application: UIApplication) {
        
    }
}
