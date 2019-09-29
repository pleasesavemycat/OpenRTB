//
//  OpenRTB2+App.swift
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
    /// This object should be included if the ad supported content is a non-browser application (typically in mobile) as opposed to a website.
    /// A bid request must not contain both an `App` and a `Site` object. At a minimum, it is useful to provide an App ID or bundle,
    /// but this is not strictly required.
    /// - Note: Conforms to OpenRTB 2.5 specification 3.2.14
    public struct App: Codable {
        /// Exchange-specific app ID.
        let id: String?
        
        /// App name (may be aliased at the publisher’s request).
        let name: String?
        
        /// A platform-specific application identifier intended to be unique to the app and independent of the exchange.
        /// On Android, this should be a bundle or package name (e.g., com.foo.mygame). On iOS, it is typically a numeric ID.
        let bundle: String?
        
        /// Domain of the app (e.g., “mygame.foo.com”).
        let domain: String?
        
        /// App store URL for an installed app; for IQG 2.1 compliance.
        let storeurl: String?
        
        /// Array of IAB content categories of the app.
        let cat: [String]?
        
        /// Array of IAB content categories that describe the current section of the app.
        let sectioncat: [String]?
        
        /// Array of IAB content categories that describe the current page or view of the app.
        let pagecat: [String]?
        
        /// Application version.
        let ver: String?
        
        /// Indicates if the app has a privacy policy, where 0 = no, 1 = yes.
        let privacypolicy: Int?
        
        /// 0 = app is free, 1 = the app is a paid version.
        let paid: Int?
        
        /// Details about the `Publisher` of the app.
        let publisher: OpenRTB2.Publisher?
        
        /// Details about the `Content` within the app.
        let content: OpenRTB2.Content?
        
        /// Comma separated list of keywords about the app.
        let keywords: String?
    }
}

// MARK: - Convenience properties that provide type translations
extension OpenRTB2.App {
    /// Flag indicating if the app is a paid version.
    /// - Note: This property is sourced by the `paid` field.
    var isPaidApp: Bool { (paid ?? 0) == 1 }
    
    /// Flag indicating if the site has a privacy policy,
    /// - Note: This property is sourced by the `privacypolicy` field.
    var hasPrivacyPolicy: Bool { (privacypolicy ?? 0) == 1 }
}
