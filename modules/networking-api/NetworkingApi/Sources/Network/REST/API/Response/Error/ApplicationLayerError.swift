// ----------------------------------------------------------------------------
//
//  ApplicationLayerError.swift
//
//  @author     Denis Kolyasev <KolyasevDA@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

public class ApplicationLayerError: AbstractRestApiError
{
// MARK: - Properties

    public override var type: RestApiErrorType {
        return .ApplicationLayer
    }

}

// ----------------------------------------------------------------------------
