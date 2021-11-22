//
//  Model.swift
//  Event
//
//  Created by Andrew Morgan on 22/11/2021.
//

import Foundation
import RealmSwift

class Event: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id = UUID().uuidString
    @Persisted var eventName = ""
    @Persisted var venueId = 0
    @Persisted var invited = 0
    @Persisted var rsvpYes = 0
    @Persisted var upcoming = false
    @Persisted var startTime = Date()
    @Persisted var endTime = Date()
    @Persisted var eventCreator = ""
    @Persisted var eventNode = ""
    @Persisted var partition = ""
    @Persisted var invitees = List<Invitee>()
}

class Invitee: EmbeddedObject, ObjectKeyIdentifiable {
    @Persisted var username = ""
    @Persisted var inviteeStatus = "User added, but invite pending"
    
    convenience init(_ username: String) {
        self.init()
        self.username = username
    }
    
    convenience init(username: String, state: InviteeStatus) {
        self.init()
        self.username = username
        // TODO: Different from code provided
        inviteeStatus = state.asString
        // inviteeStatus = state
    }
    
    var inviteeState: InviteeStatus {
        get { return InviteeStatus(rawValue: inviteeStatus) ?? .left }
        set { inviteeStatus = newValue.asString }
    }
    
    enum InviteeStatus: String {
        case invited = "User has been invited"
        case declined = "User has declined the invitation"
        case accepted = "User has accepted the invitation"
        case left = "User has left"

        var asString: String {
            self.rawValue
        }
    }
}
