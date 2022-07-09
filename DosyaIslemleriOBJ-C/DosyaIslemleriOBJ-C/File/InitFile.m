//
//  InitFile.m
//  DosyaIslemleriOBJ-C
//
//  Created by oktay on 23.06.2022.
//

#import "InitFile.h"

@implementation InitFile

+ (NSString *)initWithFileName:(NSString *)resource type:(NSString *)type exception:(NSException *)exception{
    
    NSString *content = nil;
    @try {
       
        NSString *path = [[NSBundle mainBundle] pathForResource:resource  ofType:type];
        if(path){
            NSLog(@"Find");
            content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
            NSLog(@"Content : %@ ",content);
            
        }else {
            NSLog(@"Error Can not find the file");
            exception = [[NSException alloc ] init];
            
        }
       
    } @catch (NSException *exception) {
        exception = exception;
    } @finally {
        return content ;
    }
   
}
@end
