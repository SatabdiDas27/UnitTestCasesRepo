//
//  FirstViewController.m
//  UnitTestCaseUsingXCT
//

//

#import "FirstViewController.h"
#import "LandingViewTableCellTableViewCell.h"
@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize headerName,landingTableView,landingViewCountryData,landingViewRankData;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.landingViewCountryData = [[NSMutableArray alloc]init];
    [self.landingViewCountryData addObjectsFromArray:[NSArray arrayWithObjects:@"India",@"South Africa",@"West Indies",@"Aus",@"NZ",@"Zim",@"England",@"Pak",@"Bangladesh", nil]];
    
    self.landingViewRankData = [[NSMutableArray alloc]init];
    [self.landingViewRankData addObjectsFromArray:[NSArray arrayWithObjects:@"1",@"Two",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil]];
    
    [self.headerName setText:@"ICC - 2014 Ranking"];
    
    name = @"Satish";
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidAppear:(BOOL)animated {
    [self.landingTableView setContentOffset:CGPointMake(0.0f, -64.0f)];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark -- tableview dataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.landingViewCountryData count];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellForLeftSection";
    LandingViewTableCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell== nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"LandingViewTableCellTableViewCell" owner:self options:nil];
        cell = (LandingViewTableCellTableViewCell *)[nib objectAtIndex:0];
    }
    @try {
        [cell.placeHolderCountryName setFont:[UIFont fontWithName:@"MyriadSet-Text" size:13.0]];
        [cell.placeHolderCountryRank setFont:[UIFont fontWithName:@"MyriadSet-Text" size:13.0]];
        
        [cell.placeHolderCountryName setText:[self.landingViewCountryData objectAtIndex:indexPath.row]];
        [cell.placeHolderCountryRank setText:[self.landingViewRankData objectAtIndex:indexPath.row]];
        
        if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
            [cell setAccessoryType:UITableViewCellAccessoryDetailButton];
        } else {
            [cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
        }
    }
    @catch (NSException *exception) {
        //NSLog(@"Some exception Occur %@",exception);
    }
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"row clicked");
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"     Country                                    Point";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 30;
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @"     Total                                           25";
}

@end
