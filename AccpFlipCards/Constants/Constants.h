//
//  Constants.h
//  AccpFlipCards
//
//  Created by Jitendra on 13/05/14.
//  Copyright (c) 2014 Bellurbis. All rights reserved.
//

#ifndef AccpFlipCards_Constants_h
#define AccpFlipCards_Constants_h



#endif

#define kUserDefault ( [NSUserDefaults standardUserDefaults])
#define kAppDelegate ((AccpAppDelegate*)[[UIApplication sharedApplication] delegate])

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)