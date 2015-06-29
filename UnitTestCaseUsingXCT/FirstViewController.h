//
//  FirstViewController.h
//  UnitTestCaseUsingXCT
//

//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSString *name;
}
@property(nonatomic, assign) IBOutlet UITableView *landingTableView;
@property(nonatomic, retain) IBOutlet UILabel *headerName;
@property(nonatomic, strong) NSMutableArray  *landingViewRankData;
@property(nonatomic, strong)  NSMutableArray  *landingViewCountryData;

@end
