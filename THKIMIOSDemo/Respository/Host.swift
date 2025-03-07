//
//  Host.swift
//  sirius-ios
//
//  Created by think on 2025/2/14.
//

class Host {
    
    static let shared = Host()
    
    private var isDebug = false
    
    func setDebug(_ isDebug: Bool) {
        self.isDebug = isDebug
    }
    
    
    func endpointFor(type: String) -> String {
        if self.isDebug {
            if type == "user" {
                return "http://206.238.114.18:20000"
            } else if type == "msg" {
                return "http://206.238.114.18:20000"
            } else if type == "websocket" {
                return "ws://206.238.114.18:21000/ws"
            }
        } else {
            if type == "user" {
                return "http://206.238.114.18:20000"
            } else if type == "msg" {
                return "http://206.238.114.18:20000"
            } else if type == "websocket" {
                return "ws://206.238.114.18:21000/ws"
            }
        }
        return ""
    }
}
