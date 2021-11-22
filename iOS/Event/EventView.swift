//
//  EventView.swift
//  Event
//
//  Created by Andrew Morgan on 22/11/2021.
//

import SwiftUI
import RealmSwift

struct EventView: View {
    @ObservedResults(Event.self) var events
    let username: String
    
    @State private var newEventName = ""
    
    var body: some View {
        VStack {
            List {
                ForEach(events) { event in
                    Text(event.eventName)
                }
            }
            Spacer()
            HStack {
                TextField("event name", text: $newEventName)
                Button(action: send) {
                    Text("Add event")
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
            }
        }
        .padding()
    }
    
    private func send() {
        let event = Event()
        event.partition = username
        event.eventName = newEventName
        let invitee = Invitee("Fred")
        event.invitees.append(invitee)
        $events.append(event)
        newEventName = ""
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(username: "Andrew")
    }
}
