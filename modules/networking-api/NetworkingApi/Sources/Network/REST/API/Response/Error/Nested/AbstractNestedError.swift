// ----------------------------------------------------------------------------
//
//  AbstractNestedError.swift
//
//  @author     Denis Kolyasev <KolyasevDA@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import SwiftCommons

// ----------------------------------------------------------------------------

public class AbstractNestedError: NestedError, AbstractClass
{
// MARK: - Construction

    public convenience init(entity: ResponseEntity<NSData>) {
        self.init(entity: entity, cause: nil)
    }

    public init(entity: ResponseEntity<NSData>, cause: ErrorType?)
    {
        // Init instance variables
        self.entity = entity
        self.cause = cause
    }

// MARK: - Properties

    public let entity: ResponseEntity<NSData>

    public let cause: ErrorType?

}

// ----------------------------------------------------------------------------

extension AbstractNestedError: ResponseEntityHolder
{
// MARK: - Functions

    public func getResponseEntity() -> ResponseEntity<NSData> {
        return self.entity
    }

    public func getResponseBodyAsBytes() -> NSData? {
        return self.entity.body
    }

    public func getResponseBodyAsString() -> String?
    {
        var result: String?

        if let entity = (try? StringConverter().convert(self.entity)) {
            result = entity.body
        }

        return result
    }

}

// ----------------------------------------------------------------------------

extension AbstractNestedError
{
// MARK: - Properties

    public var description: String
    {
        var result = typeName(self)

        if let cause = self.cause
        {
            result += "\nСaused by error: "

            if let description = (cause as? CustomStringConvertible)?.description.trim() where description.isNotEmpty {
                result += description
            }
            else
            if let description = (cause as? CustomDebugStringConvertible)?.debugDescription.trim() where description.isNotEmpty {
                result += description
            }
            else {
                result += typeName(cause)
            }
        }

        if let responseBody = getResponseBodyAsString() {
            result += "\nResponse body: \(responseBody)"
        }

        return result
    }

}

// ----------------------------------------------------------------------------
