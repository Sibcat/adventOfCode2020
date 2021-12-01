//
//  String+Match.swift
//  adventOfCode2020
//
//  Created by Elena Skvortsova on 01.12.2021.
//

import Foundation

extension String {
    // ["match", "group1", "group2"....]
    func match(_ regex: String) -> [[String]] {
        let nsString = self as NSString
        let matches = (try? NSRegularExpression(pattern: regex, options: []))?
            .matches(in: self, options: [], range: NSMakeRange(0, count)).map { match in
                (0..<match.numberOfRanges).map {
                    match.range(at: $0).location == NSNotFound ? "" : nsString.substring(with: match.range(at: $0))
                }
            }
        return matches ?? []
    }
}
