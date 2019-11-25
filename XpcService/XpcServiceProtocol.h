//
//  XpcServiceProtocol.h
//  XpcService
//
//  Created by Ben Chatelain on 11/24/19.
//  Copyright © 2019 Ben Chatelain. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

// The protocol that this service will vend as its API. This header file will also need to be visible to the process hosting the service.
@protocol XpcServiceProtocol

// Replace the API of this protocol with an API appropriate to the service you are vending.
- (void)upperCaseString:(NSString *)aString withReply:(void (^)(NSString *))reply;
    
@end

NS_ASSUME_NONNULL_END

/*
 To use the service from an application or other process, use NSXPCConnection to establish a connection to the service by doing something like this:

     _connectionToService = [[NSXPCConnection alloc] initWithServiceName:@"at.phatbl.XpcService"];
     _connectionToService.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol:@protocol(XpcServiceProtocol)];
     [_connectionToService resume];

Once you have a connection to the service, you can use it like this:

     [[_connectionToService remoteObjectProxy] upperCaseString:@"hello" withReply:^(NSString *aString) {
         // We have received a response. Update our text field, but do it on the main thread.
         NSLog(@"Result string was: %@", aString);
     }];

 And, when you are finished with the service, clean up the connection like this:

     [_connectionToService invalidate];
*/
