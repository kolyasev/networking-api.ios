// ----------------------------------------------------------------------------
//
//  JsonBody.swift
//
//  @author     Denis Kolyasev <KolyasevDA@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import Foundation

import SwiftCommons
import SwiftyJSON

// ----------------------------------------------------------------------------

public class JsonBody: HttpBody
{
// MARK: - Construction

    public init(body: JsonElement?)
    {
        // Init instance variables
        self.jsonBody = body
    }

// MARK: - Properties

    public var mediaType: MediaType? {
        return JsonBody.MediaTypeJson
    }

    public var body: NSData? {
        guard let jsonBody = self.jsonBody else {
            return nil
        }
        return try? JSON(jsonBody).rawData()
    }

// MARK: - Constants

    private static let MediaTypeJson =
            MediaType.valueOf(MediaType.ApplicationJsonValue + "; charset=" + HttpKeys.EncodingName.UTF_8)

// MARK: - Variables
    
    private let jsonBody: JsonElement?

}

// ----------------------------------------------------------------------------
