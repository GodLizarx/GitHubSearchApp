//
//  API+default.swift
//  GitHubSeachTest
//
//  Created by Misha Deneka on 16.07.2024.
//

import Foundation

public extension API {
    var timeoutInterval: TimeInterval {
        return 30
    }
    
    var host: String {
        "https://api.github.com/"
    }
}
