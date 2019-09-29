//
//  OpenRTB2+Regulations.swift
//  
//  Copyright (c) 2019 Kelly Dun
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Foundation

extension OpenRTB2 {
    /// This object contains any legal, governmental, or industry regulations that apply to the request.
    /// The coppa flag signals whether or not the request falls under the United States Federal Trade Commission’s regulations
    /// for the United States Children’s Online Privacy Protection Act (“COPPA”).
    /// - Note: Conforms to OpenRTB 2.5 specification 3.2.3
    public struct Regulations: Codable {
        /// Flag indicating if this request is subject to the COPPA regulations established by the USA FTC, where 0 = no, 1 = yes.
        let coppa: Int?
    }
}

// MARK: - Convenience properties that provide type translations
extension OpenRTB2.Regulations {
    /// Flag indicating if this request is subject to the COPPA regulations established by the USA FTC.
    /// - Note: This property is sourced by the `coppa` field.
    var isSubjectToCOPPA: Bool { (coppa ?? 0) == 1 }
}
