//
//  displayBrightness.swift
//  displayBrightness
//
//  Created by emartin on 2017-01-02.
//  Copyright © 2017 etiennemartin.ca. All rights reserved.
//

import Foundation

func getDisplayBrightness() -> Float? {
    var iterator: io_iterator_t = 0
    let result = IOServiceGetMatchingServices(kIOMasterPortDefault, IOServiceMatching("IODisplayConnect"), &iterator)
    
    if result == kIOReturnSuccess {
        var service: io_service_t = 1
        
        while true {
            service = IOIteratorNext(iterator)
            
            if service == 0 { break; }
            
            var brightness:Float = 0.0
            IODisplayGetFloatParameter(service, UInt32(0), kIODisplayBrightnessKey as CFString!, &brightness)
            IOObjectRelease(service)
            return brightness
        }
    }
    
    return nil
}
