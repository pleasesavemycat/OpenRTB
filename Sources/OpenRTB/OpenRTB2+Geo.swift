//
//  OpenRTB2+Geo.swift
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
    /// The following enumeration lists the options to indicate how the geographic information was determined.
    /// - Note: Conforms to OpenRTB 2.5 specification 5.20
    public enum LocationType: Int, Codable {
        case gps = 1
        case ipAddress = 2
        case userProvided = 3
    }
    
    /// The following enumeration lists the services and/or vendors used for resolving IP addresses to geolocations.
    /// - Note: Conforms to OpenRTB 2.5 specification 5.23
    public enum IPLocationService: Int, Codable {
        case ip2location = 1
        case neustar = 2
        case maxMind = 3
        case netAcuity = 4
    }
    
    /// This object encapsulates various methods for specifying a geographic location.
    /// When subordinate to a `Device` object, it indicates the location of the device which can also be interpreted as the user’s current location.
    /// When subordinate to a `User` object, it indicates the location of the user’s home base (i.e., not necessarily their current location).
    /// The lat/lon attributes should only be passed if they conform to the accuracy depicted in the type attribute.
    /// For example, the centroid of a geographic region such as postal code should not be passed.
    /// - Note: Conforms to OpenRTB 2.5 specification 3.2.19
    public struct Geo: Codable {
        /// Latitude from -90.0 to +90.0, where negative is south.
        let lat: Float?
        
        /// Longitude from -180.0 to +180.0, where negative is west.
        let lon: Float?
        
        /// Source of location data; recommended when passing `lat`/`lon`.
        let type: OpenRTB2.LocationType?
        
        /// Estimated location accuracy in meters; recommended when lat/lon are specified and derived from a device’s location services (i.e., type = 1).
        /// Note that this is the accuracy as reported from the device. Consult OS specific documentation (e.g., Android, iOS) for exact interpretation.
        let accuracy: Int?
        
        /// Number of seconds since this geolocation fix was established. Note that devices may cache location data across multiple fetches.
        /// Ideally, this value should be from the time the actual fix was taken.
        let lastfix: TimeInterval?
        
        /// Service or provider used to determine geolocation from IP address if applicable (i.e., `type` = `ipAddress`).
        let ipservice: OpenRTB2.IPLocationService?
        
        /// Country code using ISO-3166-1-alpha-3.
        let country: String?
        
        /// Region code using ISO-3166-2; 2-letter state code if USA.
        let region: String?
        
        /// Region of a country using FIPS 10-4 notation. While OpenRTB supports this attribute, it has been withdrawn by NIST in 2008.
        let regionfips104: String?
        
        /// Google metro code; similar to but not exactly Nielsen DMAs.
        let metro: String?
        
        /// City using United Nations Code for Trade & Transport Locations.
        let city: String?
        
        /// Zip or postal code.
        let zip: String?
        
        /// Local time as the number +/- of minutes from UTC.
        let utcoffset: Int?
    }
}
