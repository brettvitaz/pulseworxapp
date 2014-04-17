//
//  ImportUpeFile.m
//  PulseWorx
//
//  Created by Brett Vitaz on 4/12/14.
//  Copyright (c) 2014 Brett Vitaz. All rights reserved.
//

#import "ImportUpe.h"
#import "NSString+ParsingExtensions.h"
#import "PulseWorxSystemParser.h"
#import "PulseWorxSystem.h"

@interface ImportUpe()
@property (nonatomic) NSString *systemName;
@property (nonatomic) NSString *upeString;
- (void)parseString:(NSString *)upeString;

@end

@implementation ImportUpe

- (id)initWithString:(NSString *)upeString {
    if (self = [super init]) {
        [self setSystemName:@"PulseWorx System"];
        [self setUpeString:upeString];
        [self parseString:upeString];
    }
    return self;
}

- (id)initWithFile:(NSString *)fileName {
    [self setSystemName:fileName];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"upe"];
    self = [self initWithString:[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil]];
    return self;
}

- (void)parseString:(NSString *)upeString {
//    NSScanner *scanner = [NSScanner scannerWithString:upeString];
    NSLog(@"%@", [upeString csvRows]);
    PulseWorxSystemParser *parser = [[PulseWorxSystemParser alloc] initWithData:[upeString csvRows]];
    

    
}



@end
