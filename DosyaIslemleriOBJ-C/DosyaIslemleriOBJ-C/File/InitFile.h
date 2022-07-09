//
//  InitFile.h
//  DosyaIslemleriOBJ-C
//
//  Created by oktay on 23.06.2022.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface InitFile : NSObject
+(NSString *) initWithFileName:(NSString *)resource type:(NSString *)type exception:(NSException *) exception;
@end

NS_ASSUME_NONNULL_END
