//
//  CheckSMS.h
//  SecureCoffee
//
//  Created by John on 2/15/17.
//  Copyright © 2017 john. All rights reserved.
//

#ifndef CheckSMS_h
#define CheckSMS_h

@interface CheckSMS : NSObject
@property (strong, nonatomic) id someProperty;

- (double) runSMS;
- (void) logCallback: (NSString*)logMessage;


@end

#endif /* CheckSMS_h */
