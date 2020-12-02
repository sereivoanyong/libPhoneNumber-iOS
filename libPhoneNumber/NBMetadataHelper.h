//
//  NBMetadataHelper.h
//  libPhoneNumber
//
//  Created by tabby on 2015. 2. 8..
//  Copyright (c) 2015년 ohtalk.me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NBPhoneNumberDefines.h"

@class NBPhoneMetaData;

@interface NBMetadataHelper : NSObject

+ (BOOL)hasValue:(NSString *)string;

- (instancetype)initWithZippedData:(NSData *)data expandedLength:(NSUInteger)expandedLength;

- (instancetype)init;

- (NSArray<NSString *> *)regionCodeFromCountryCode:(int32_t)countryCodeNumber;
- (NSString *)countryCodeFromRegionCode:(NSString *)regionCode;

- (NBPhoneMetaData *)getMetadataForNonGeographicalRegion:(int32_t)countryCallingCode;
- (NBPhoneMetaData *)getMetadataForRegion:(NSString *)regionCode;

- (NSDictionary<NSString *, NSString *> *)countryCodeToCountryNumberDictionary;
- (NSArray<NSDictionary<NSString *, id> *> *)getAllMetadata;

@end
