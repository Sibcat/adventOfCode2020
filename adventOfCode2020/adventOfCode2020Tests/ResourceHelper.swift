//
//  ResourceHelper.swift
//  adventOfCode2020Tests
//
//  Created by Elena Skvortsova on 10.12.2020.
//

import Foundation

class ResourceHelper {
    static let instance = ResourceHelper()
    
    private init() {}
    
    func getInput(from resourceName: String) -> String {
        let bundle = Bundle(for: type(of: self))
        guard let inputURL = bundle.url(forResource: resourceName, withExtension: ""),
              let contents = FileManager.default.contents(atPath: inputURL.path),
              let str = String(data: contents, encoding: String.Encoding.utf8) else {
            return ""
        }
        
        return str
    }
}
