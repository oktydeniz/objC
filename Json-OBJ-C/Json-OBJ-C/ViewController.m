//
//  ViewController.m
//  Json-OBJ-C
//
//  Created by oktay on 26.06.2022.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSException *exception;
    NSString *content = [RunFiles readFromMainBundleWithResource:@"example" andType:@"json" exception:exception];
    NSData *data = [content dataUsingEncoding:NSUTF8StringEncoding];
    //kNilOptions -> arada hicbir bosluk birakilmasin
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:NULL];
    
    NSArray *arr1 = [dic objectForKey:@"people"];
    NSDictionary *p1 = [arr1 objectAtIndex:0];
    
    
    NSNumber *age = [p1 objectForKey:@"age"];
    NSString *name = [p1 objectForKey:@"name"];
    
    NSLog(@"Data : %@", name);
    NSLog(@"Data Age : %ld ", (long)age.integerValue);
    
    //create dic in dic
    NSMutableDictionary *mutableJson = [NSMutableDictionary dictionary];
    
    NSMutableDictionary *mutable = [NSMutableDictionary dictionary];
    
    NSString *name1 = @"Oktay Deniz";
    NSNumber *age1 = [NSNumber numberWithInt:24];
    
    [mutable setObject:name1 forKey:@"name"];
    [mutable setObject:age1 forKey:@"age"];
    
    [mutableJson setObject:mutable forKey:@"people"];
    
    //NSJSONWritingPrettyPrinted -> duzgun yazim
    NSData *newJsonToStr =  [NSJSONSerialization dataWithJSONObject:mutableJson options:NSJSONWritingPrettyPrinted error:NULL ];
    
    NSString *strFromData = [[NSString alloc ] initWithData:newJsonToStr encoding:NSUTF8StringEncoding];
    NSLog(@" New Json :: %@", strFromData);
    
}


@end
