//
//  XpcService.h
//  XpcService
//
//  Created by Ben Chatelain on 11/24/19.
//  Copyright © 2019 Ben Chatelain. All rights reserved.
//

#import "XpcServiceProtocol.h"

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

// This object implements the protocol which we have defined. It provides the actual behavior for the service. It is 'exported' by the service to make it available to the process hosting the service over an NSXPCConnection.
@interface XpcService : NSObject <XpcServiceProtocol>
@end

NS_ASSUME_NONNULL_END
