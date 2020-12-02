//
//  NBPhoneNumber.m
//  libPhoneNumber
//
//

#import "NBPhoneNumber.h"
#import "NBPhoneNumberDefines.h"

@implementation NBPhoneNumber

- (instancetype)init {
  self = [super init];

  if (self) {
    self.countryCode = 0;
    self.nationalNumber = 0;
    self.extension = nil;
    self.italianLeadingZero = NO;
    self.numberOfLeadingZeros = 1;
    self.rawInput = nil;
    self.countryCodeSource = NBECountryCodeSourceUNSPECIFIED;
    self.preferredDomesticCarrierCode = nil;
  }

  return self;
}

- (NSUInteger)hash {
  // See https://stackoverflow.com/questions/4948780/magic-number-in-boosthash-combine
  NSUInteger hash = @(self.countryCode).hash;
  hash ^= @(self.nationalNumber).hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
  hash ^= @(self.numberOfLeadingZeros).hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
  hash ^= self.extension.hash + 0x9e3779b9 + (hash << 6) + (hash >> 2);
  return hash;
}

- (BOOL)isEqual:(id)object {
  if (![object isKindOfClass:[NBPhoneNumber class]]) {
    return NO;
  }

  NBPhoneNumber *other = object;
  return self.countryCode == other.countryCode &&
         self.nationalNumber == other.nationalNumber &&
         self.italianLeadingZero == other.italianLeadingZero &&
         self.numberOfLeadingZeros == other.numberOfLeadingZeros &&
         ((self.extension == nil && other.extension == nil) || [self.extension isEqualToString:other.extension]);
}

- (id)copyWithZone:(NSZone *)zone {
  NBPhoneNumber *phoneNumberCopy = [[NBPhoneNumber allocWithZone:zone] init];

  phoneNumberCopy.countryCode = self.countryCode;
  phoneNumberCopy.nationalNumber = self.nationalNumber;
  phoneNumberCopy.extension = [self.extension copy];
  phoneNumberCopy.italianLeadingZero = self.italianLeadingZero;
  phoneNumberCopy.numberOfLeadingZeros = self.numberOfLeadingZeros;
  phoneNumberCopy.rawInput = [self.rawInput copy];
  phoneNumberCopy.countryCodeSource = self.countryCodeSource;
  phoneNumberCopy.preferredDomesticCarrierCode = [self.preferredDomesticCarrierCode copy];

  return phoneNumberCopy;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
  if (self = [super init]) {
    self.countryCode = [coder decodeInt32ForKey:@"countryCode"];
    self.nationalNumber = (uint64_t)[coder decodeInt64ForKey:@"nationalNumber"];
    self.extension = [coder decodeObjectForKey:@"extension"];
    self.italianLeadingZero = [coder decodeBoolForKey:@"italianLeadingZero"];
    self.numberOfLeadingZeros = [coder decodeIntegerForKey:@"numberOfLeadingZeros"];
    self.rawInput = [coder decodeObjectForKey:@"rawInput"];
    self.countryCodeSource = [coder decodeIntegerForKey:@"countryCodeSource"];
    self.preferredDomesticCarrierCode = [coder decodeObjectForKey:@"preferredDomesticCarrierCode"];
  }
  return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
  [coder encodeInt32:self.countryCode forKey:@"countryCode"];
  [coder encodeInt64:(int64_t)self.nationalNumber forKey:@"nationalNumber"];
  [coder encodeObject:self.extension forKey:@"extension"];
  [coder encodeBool:self.italianLeadingZero forKey:@"italianLeadingZero"];
  [coder encodeInteger:self.numberOfLeadingZeros forKey:@"numberOfLeadingZeros"];
  [coder encodeObject:self.rawInput forKey:@"rawInput"];
  [coder encodeInteger:self.countryCodeSource forKey:@"countryCodeSource"];
  [coder encodeObject:self.preferredDomesticCarrierCode forKey:@"preferredDomesticCarrierCode"];
}

- (NSString *)description {
  return [NSString
      stringWithFormat:@" - countryCode[%d], nationalNumber[%lld], extension[%@], "
                       @"italianLeadingZero[%@], numberOfLeadingZeros[%lu], rawInput[%@] "
                       @"countryCodeSource[%ld] preferredDomesticCarrierCode[%@]",
                       self.countryCode, self.nationalNumber, self.extension,
                       self.italianLeadingZero ? @"Y" : @"N", (unsigned long)self.numberOfLeadingZeros,
                       self.rawInput, (long)self.countryCodeSource, self.preferredDomesticCarrierCode];
}

@end
