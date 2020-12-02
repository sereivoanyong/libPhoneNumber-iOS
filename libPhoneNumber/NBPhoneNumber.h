//
//  NBPhoneNumber.h
//  libPhoneNumber
//
//

#import <Foundation/Foundation.h>
#import "NBPhoneNumberDefines.h"

@interface NBPhoneNumber : NSObject <NSCopying, NSCoding>

// from phonemetadata.pb.js
/* 1 */ @property(nonatomic, assign, readwrite) int32_t countryCode;
/* 2 */ @property(nonatomic, assign, readwrite) uint64_t nationalNumber;
/* 3 */ @property(nonatomic, strong, readwrite) NSString *extension;
/* 4 */ @property(nonatomic, assign, readwrite) BOOL italianLeadingZero;
/* 8 */ @property(nonatomic, assign, readwrite) NSUInteger numberOfLeadingZeros;
/* 5 */ @property(nonatomic, strong, readwrite) NSString *rawInput;
/* 6 */ @property(nonatomic, assign, readwrite) NBECountryCodeSource countryCodeSource;
/* 7 */ @property(nonatomic, strong, readwrite) NSString *preferredDomesticCarrierCode;

@end
