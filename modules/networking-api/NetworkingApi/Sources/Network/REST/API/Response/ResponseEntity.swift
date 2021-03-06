// ----------------------------------------------------------------------------
//
//  ResponseEntity.swift
//
//  @author     Denis Kolyasev <KolyasevDA@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

// FIXME: Should be generic protocol!

// ----------------------------------------------------------------------------

public class ResponseEntity<T>: RequestEntity<T>
{
// MARK: - Construction

    init(url: NSURL?, headers: HttpHeaders?, cookies: [HttpCookie]?, body: T?, status: HttpStatus?, mediaType: MediaType?)
    {
        // Init instance variables
        self.status = status
        self.mediaType = mediaType

        // Parent processing
        super.init(url: url, headers: headers, cookies: cookies, body: body)
    }

// MARK: - Properties

    public let status: HttpStatus?

    public let mediaType: MediaType?

}

// ----------------------------------------------------------------------------
