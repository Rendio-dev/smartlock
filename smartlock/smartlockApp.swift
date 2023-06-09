//
//  smartlockApp.swift
//  smartlock
//
//  Created by Meichel Rendio on 07/06/23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct smartlockApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate


  var body: some Scene {
    WindowGroup {
      NavigationView {
        ContentView()
      }
    }
  }
}


//import SwiftUI
//
//@main
//struct macroApp: App {
//    let persistenceController = PersistenceController.shared
//
//    @AppStorage("BackToMain") var backtomain:Bool = false
//
//
//
//        firebaseHelper = macro.firebaseHelper()
//        firebaseHelper.getDataFromFireBase()
//    }
//
//    var body: some Scene {
//        WindowGroup {
//            if(UIDevice.current.userInterfaceIdiom == .pad){
//                MainPageIpad(firebaseHelper:firebaseHelper, plantStatus: $firebaseHelper.statusTanaman)
//                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
//            }else if(backtomain){
//                MainPage(firebaseHelper:firebaseHelper, plantStatus: $firebaseHelper.statusTanaman)
//                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
//            }else{
//                MainPage(firebaseHelper:firebaseHelper, plantStatus: $firebaseHelper.statusTanaman)
//                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
//            }
//        }
//    }
//}
