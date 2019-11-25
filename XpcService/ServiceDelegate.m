//
//  ServiceDelegate.m
//  XpcService
//
//  Created by Ben Chatelain on 11/24/19.
//  Copyright © 2019 Ben Chatelain. All rights reserved.
//

#import "ServiceDelegate.h"
#import "XpcService.h"

@implementation ServiceDelegate

- (BOOL)listener:(NSXPCListener *)listener shouldAcceptNewConnection:(NSXPCConnection *)newConnection {
    // This method is where the NSXPCListener configures, accepts, and resumes a new incoming NSXPCConnection.

    // Configure the connection.
    // First, set the interface that the exported object implements.
    newConnection.exportedInterface = [NSXPCInterface interfaceWithProtocol:@protocol(XpcServiceProtocol)];

    // Next, set the object that the connection exports. All messages sent on the connection to this service will be sent to the exported object to handle. The connection retains the exported object.
    XpcService *exportedObject = [XpcService new];
    newConnection.exportedObject = exportedObject;

    // Resuming the connection allows the system to deliver more incoming messages.
    [newConnection resume];

    // Returning YES from this method tells the system that you have accepted this connection. If you want to reject the connection for some reason, call -invalidate on the connection and return NO.
    return YES;
}

@end
