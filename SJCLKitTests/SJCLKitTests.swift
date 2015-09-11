//
//  SJCLKitTests.swift
//  SJCLKitTests
//
//  Created by Craig Patten on 12/09/2015.
//  Copyright © 2015 Moondust. All rights reserved.
//

import XCTest
@testable import SJCLKit

class SJCLKitTests: XCTestCase {
    let sjcl = SJCL()
    
    func test() {
        let password = "Yadda yadda.";
        let plaintext = "This is a test of the emergency broadcast system."
        
        XCTAssert(sjcl.decrypt(password, data: sjcl.encrypt(password, data: plaintext)) == plaintext)
    }
}
