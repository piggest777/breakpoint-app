//
//  Message.swift
//  breakpoint-app
//
//  Created by Denis Rakitin on 2018-08-02.
//  Copyright © 2018 Denis Rakitin. All rights reserved.
//

import Foundation

class Message{
    private var _content: String
    private var _senderId: String
    
    var content: String {
        return _content
    }
    
    var senderId: String{
        return _senderId
    }
    
    init (content: String, senderId: String) {
        self._content = content
        self._senderId = senderId
    }
}
