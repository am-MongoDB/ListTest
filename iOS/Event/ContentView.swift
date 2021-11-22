//
//  ContentView.swift
//  Event
//
//  Created by Andrew Morgan on 22/11/2021.
//

import SwiftUI

struct ContentView: View {
    @State var username = ""
    
    var body: some View {
        if username == "" {
            LoginView(username: $username)
        } else {
            EventView(username: username)
                .environment(\.realmConfiguration, realmApp.currentUser!.configuration(partitionValue: username))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
