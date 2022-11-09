//
//  MockEventTypes.swift
//  takehomeUnitTests
//
//  Created by Alex Kovalyshyn on 08.11.2022.
//

import Foundation
@testable import takehome

let mockEventTypes: [takehome.EventType] = [
    EventType(name: "15 minute ", color: "#f8e436", duration: 15, schedulingUrl:  "https://calendly.com/decode_alex/15-minute", uri: "https://api.calendly.com/event_types/797e7be5-54c7-4443-a961-afb477a7fec0", active: true, kind: .solo),
    
    EventType(name: "1 hour meeting", color: "#8247f5", duration: 60, schedulingUrl:  "https://calendly.com/decode_alex/1-hour-meeting", uri: "https://api.calendly.com/event_types/bc4b3dcb-d572-42ef-98dd-9e9dedb7ef5b", active: false, kind: .solo),
    
    EventType(name: "30 Minute Meeting", color: "#f8e436", duration: 30, schedulingUrl:  "https://calendly.com/decode_alex/30min", uri: "https://api.calendly.com/event_types/3937b2a6-9bb1-4b8f-87cd-24e53f43981b", active: false, kind: .group),
]
