//
//  FileManager.swift
//  Beneficiaries
//
//  Created by Khateeb Hussain on 10/26/22.
//

import Foundation

enum AppFileManagerError: Error {
    case invalidData
}

class AppFileManager {
    static let shared = AppFileManager()
    
    func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        return nil
    }
}
