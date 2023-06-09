//
//  ContentView.swift
//  smartlock
//
//  Created by Meichel Rendio on 07/06/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var firebaseHelper: FirebaseHelper = FirebaseHelper()
    @State var pass: String = ""
    @State var newPassword: String = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Password: \(firebaseHelper.password)")
            TextField("Enter new Password", text: $newPassword)
        }
        .padding()
        .onAppear {
            firebaseHelper.getPassword()
            pass = firebaseHelper.password
        }
        .onChange(of: firebaseHelper.password) { newValue in
            pass = newValue
        }
        .onChange(of: newPassword) { newValue in
            firebaseHelper.updatePassword(newPassword: newValue)
            pass = newValue
        }
    }
}
