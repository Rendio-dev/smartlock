//
//  FirebaseHelper.swift
//  smartlock
//
//  Created by Meichel Rendio on 08/06/23.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseDatabase
import SwiftUI

class FirebaseHelper: ObservableObject {
    let db: Firestore
    @Published var password: String = "Loading..."
    
    init() {
        db = Firestore.firestore()
    }
    
    func getPassword() {
        let databaseURL = "https://smartlock-13108-default-rtdb.asia-southeast1.firebasedatabase.app/"
        let databaseRef = Database.database(url: databaseURL).reference().child("hotelA/kamar001/password")
        
        databaseRef.observeSingleEvent(of: .value) { snapshot in
            if let passwordValue = snapshot.value as? String {
                self.password = passwordValue
            }
        }
    }
    
    func updatePassword(newPassword: String) {
        let databaseURL = "https://smartlock-13108-default-rtdb.asia-southeast1.firebasedatabase.app/"
        let databaseRef = Database.database(url: databaseURL).reference().child("hotelA/kamar001/password")
        databaseRef.setValue(newPassword) { error, _ in
            if let error = error {
                print("Error updating password: \(error.localizedDescription)")
            } else {
                print("Password updated successfully")
                self.password = newPassword
            }
        }
    }
}
