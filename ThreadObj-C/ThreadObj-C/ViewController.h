//
//  ViewController.h
//  ThreadObj-C
//
//  Created by oktay on 18.06.2022.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)btnTop:(id)sender;
//nonatomic bir thread erisirken bir digeri erisemesin
//atomic istenilen anda okunabilen varsayilan

@property (atomic) NSString *contex;

@end

