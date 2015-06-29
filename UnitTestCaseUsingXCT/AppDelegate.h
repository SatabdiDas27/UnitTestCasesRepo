//
//  AppDelegate.h
//  UnitTestCaseUsingXCT
//

//

#import <UIKit/UIKit.h>
@class  FirstViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    FirstViewController *_landingView;

}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) FirstViewController *landingView;
@property (strong, nonatomic)UINavigationController *navController;

-(void) loadTheMainView;
@end

