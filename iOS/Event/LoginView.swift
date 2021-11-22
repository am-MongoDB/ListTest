//
//  LoginView.swift
//  Event
//
//  Created by Andrew Morgan on 22/11/2021.
//

import SwiftUI

struct LoginView: View {
    @Binding var username: String
    
    var body: some View {
        Text("Logging in....")
            .onAppear(perform: login)
    }
    
    private func login() {
        Task {
            do {
                let user = try await realmApp.login(credentials: .anonymous)
                username = user.id
            } catch {
                print("Failed to login: \(error.localizedDescription)")
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(username: .constant("Andrew"))
    }
}
