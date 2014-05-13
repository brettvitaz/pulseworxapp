//
//  NSData_Conversion.h
//  PulseWorx
//
//  Created by Brett Vitaz on 5/10/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//
//  Original code written by: John
//  http://stackoverflow.com/questions/16521164/how-can-i-convert-nsdata-to-hex-string
//

#import <Foundation/Foundation.h>

@interface NSData (Conversion)

- (NSString *)hexadecimalString;

@end

@implementation NSData (Conversion)

#pragma mark - String Conversion
- (NSString *)hexadecimalString
{
    /* Returns hexadecimal string of NSData. Empty string if data is empty.   */
    
    const unsigned char *dataBuffer = (const unsigned char *)[self bytes];
    
    if (!dataBuffer)
    {
        return [NSString string];
    }
    
    NSUInteger          dataLength  = [self length];
    NSMutableString     *hexString  = [NSMutableString stringWithCapacity:(dataLength * 2)];
    
    for (int i = 0; i < dataLength; ++i)
    {
        [hexString appendFormat:@"%02x", (unsigned int)dataBuffer[i]];
    }
    
    return [NSString stringWithString:hexString];
}
@end