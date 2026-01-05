//
//  URL+ImageAssets.swift
//  GhibliSwiftUIApp
//
//  Created by Thais Souza on 04/01/26.
//

import UIKit

extension URL {
    /// Retrieves (or creates should it be necessary) a temporary image's local URL on cache directory for testing purposes
    /// - Parameter name: image name retrieved from asset catalog
    /// - Parameter imageExtension: Image type. Defaults to `.jpg` kind
    /// - Returns: Resulting URL for named image
    static func convertAssetImage(
        named name: String,
        extension: String = "jpg"
    ) -> URL? {
        
        let fileManager = FileManager.default
        
        guard let cacheDirectory = fileManager
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first else {
            return nil
        }
        
        let url = cacheDirectory.appendingPathComponent("\(name).\(`extension`)")
        
        guard !fileManager.fileExists(atPath: url.path) else {
            return url
        }
        
        guard let image = UIImage(named: name),
              let data = image.jpegData(compressionQuality: 1) else {
            return nil
        }
        
        fileManager.createFile(
            atPath: url.path,
            contents: data,
            attributes: nil
        )
        
        return url
    }
    
    
}
