//
//  ViewController.m
//  ThreadObj-C
//
//  Created by oktay on 18.06.2022.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //sleep(10);
   // [NSThread sleepForTimeInterval:5];
    //[NSThread detachNewThreadSelector:@selector(threadCalled) toTarget:self withObject:nil];
    NSThread *th1 =[[NSThread alloc ] initWithTarget:self selector:@selector(threadCalled) object:nil];
    
    [th1 start];
    [th1 cancel];
    [th1 isCancelled];
    th1.threadPriority = 1.0 ;//diger threadlarin onunde gecer thread onemini belirtir
    
    //en cok bu sekilde kullanllir
    [self performSelectorInBackground:@selector(threadCalled) withObject:nil];
    NSThread *th = [NSThread mainThread];
    
    //ana thread a erisme
    
    
    NSLog(@"Thread Done! ");
}


-(void) threadCalled{
    
    //internet logic
    sleep(5);
    NSLog(@"threadCalled");
}

- (IBAction)btnTop:(id)sender {
    NSLog(@"Clicked");
    [NSThread sleepForTimeInterval:5];
}
@end
