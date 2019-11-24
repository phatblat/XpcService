//
//  XpcService.m
//  XpcService
//
//  Created by Ben Chatelain on 11/24/19.
//  Copyright © 2019 Ben Chatelain. All rights reserved.
//

#import "XpcService.h"

@implementation XpcService

// This implements the example protocol. Replace the body of this class with the implementation of this service's protocol.
- (void)upperCaseString:(NSString *)aString withReply:(void (^)(NSString *))reply {
    NSString *response = [aString uppercaseString];
    reply(response);
}

@end
