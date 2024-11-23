//
//  FirebaseManager.swift
//  BeachCleanUp
//
//  Created by Yumeng Liu on 10/27/24.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseMLModelDownloader

class FirebaseManager: NSObject {
    let firestore: Firestore
    static let shared = FirebaseManager()
    
    override init() {
        FirebaseApp.configure()
        self.firestore = Firebase.Firestore.firestore()
        super.init()
    }
    
    static func loadTrashIdentifier(completion: @escaping (CustomModel?) -> ()) {
        let downloadConditions = ModelDownloadConditions(allowsCellularAccess: false)
        ModelDownloader.modelDownloader()
            .getModel(name: "trash-classifier",
                      downloadType: .latestModel,
                      conditions: downloadConditions,
                      progressHandler: { progress in
                        // Handle progress.
                        
                      }) { result in
                // Handle download result.
                switch result {
                case let .success(model): return completion(model) // Use model.
                case let .failure(error): return completion(nil) // Handle error.
                }
            }
    }
        
}
