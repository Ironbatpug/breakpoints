//
//  Group.swift
//  breakpoint
//
//  Created by Molnár Csaba on 2019. 09. 07..
//  Copyright © 2019. Molnár Csaba. All rights reserved.
//

import Foundation

class Group{
    private var _grouptitle: String
    private var _desc: String
    private var _key: String
    private var _memberCount: Int
    private var _members: [String]
    
    var grouptitle: String {
        return _grouptitle
    }
    
    var desc: String {
        return _desc
    }
    
    var key: String {
        return _key
    }
    
    var memberCount: Int {
        return _memberCount
    }
    
    var members: [String] {
        return _members
    }
    
    init(title: String, desc: String, key: String, members: [String], memberCount: Int) {
        self._grouptitle = title
        self._desc = desc
        self._key = key
        self._memberCount = memberCount
        self._members = members
    }
    
}
