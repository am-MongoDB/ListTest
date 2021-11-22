//
//  EventApp.swift
//  Event
//
//  Created by Andrew Morgan on 22/11/2021.
//

import SwiftUI
import RealmSwift

// TODO: Set App ID
let realmApp = RealmSwift.App(id: "events-xxxxx")

@main
struct EventApp: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
