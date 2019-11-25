//
//  main.m
//  XpcService
//
//  Created by Ben Chatelain on 11/24/19.
//  Copyright © 2019 Ben Chatelain. All rights reserved.
//

#import "ServiceDelegate.h"
#import "XpcService.h"

@import Foundation;

int main(int argc, const char *argv[])
{
    // Create the delegate for the service.
    ServiceDelegate *delegate = [ServiceDelegate new];
    
    // Set up the one NSXPCListener for this service. It will handle all incoming connections.
    NSXPCListener *listener = [NSXPCListener serviceListener];
    listener.delegate = delegate;
    
    // Resuming the serviceListener starts this service. This method does not return.
    [listener resume];
    return 0;
}
