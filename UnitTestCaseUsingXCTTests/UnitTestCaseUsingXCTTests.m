//
//  UnitTestCaseUsingXCTTests.m
//  UnitTestCaseUsingXCTTests
//
//  Created by Satish Kumar17 on 10/20/14.
//  Copyright (c) 2014 Satish Kumar17. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "FirstViewController.h"
#import "AppDelegate.h"

@interface UnitTestCaseUsingXCTTests : XCTestCase
{
UIApplication           *application;
AppDelegate             *appDelegate;
FirstViewController     *landingView;
}
//@property (nonatomic, strong) FirstViewController     *firstView;

@end

@implementation UnitTestCaseUsingXCTTests

- (void)setUp {
    [super setUp];
    application             = [UIApplication sharedApplication];
    
    appDelegate             = [[UIApplication sharedApplication] delegate];
    [appDelegate landingView];
    
    landingView    = (FirstViewController *)[appDelegate landingView];
    
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}
/* Test that appDelegagte is not nil */
- (void) testApplication    //-satish
{
    XCTAssertNotNil(application, @"Cannot find application instance");
}

/* Test that appDelegagte is not nil */
- (void) testAppDelegate  //-satish
{
    XCTAssertNotNil(appDelegate, @"Cannot find appDelegate instance");
}

/* Test that landing view is not nil */
- (void) testLandingView  //-satish
{
    XCTAssertNotNil(landingView, @"Cannot find View Controller instance");
}

/* Test that data view is not nil */
- (void) testDataView  //-satish
{
    XCTAssertNotNil(landingView, @"Cannot find First View controller instance");

}

#pragma mark - View loading tests
-(void)testThatViewLoads
{
    
    XCTAssertNotNil(landingView.view, @"View not initiated properly");
}

- (void)testParentViewHasTableViewSubview
{
    NSArray *subviews = landingView.view.subviews;
    XCTAssertTrue([subviews containsObject:landingView.landingTableView], @"View does not have a table subview");
}

-(void)testThatTableViewLoads
{
    XCTAssertNotNil(landingView.landingTableView, @"TableView not initiated");
}

#pragma mark - UITableView tests

//Test case to check presence of data source.
- (void)testThatViewConformsToUITableViewDataSource
{
    XCTAssertTrue([landingView conformsToProtocol:@protocol(UITableViewDataSource) ], @"View does not conform to UITableView datasource protocol");
}

//Test case to check connection of data source with table view.
- (void)testThatTableViewHasDataSource
{
    XCTAssertNotNil(landingView.landingTableView.dataSource, @"Table datasource cannot be nil");
}

//Test case to check presence of delegate.
- (void)testThatViewConformsToUITableViewDelegate
{
    XCTAssertTrue([landingView conformsToProtocol:@protocol(UITableViewDelegate) ], @"View does not conform to UITableView delegate protocol");
}

//Test case to check connection of delegate with table view.
- (void)testTableViewIsConnectedToDelegate
{
    XCTAssertNotNil(landingView.landingTableView.delegate, @"Table delegate cannot be nil");
}

//Test case to check number of rows.
- (void)testTableViewNumberOfRowsInSection
{
    NSInteger expectedRows = 3; //change the value of expected row and observe the status *** set Expected row =9 and run the test case
    XCTAssertTrue([landingView tableView:landingView.landingTableView numberOfRowsInSection:0]==expectedRows, @"Table has %ld rows but it should have %ld", (long)[landingView tableView:landingView.landingTableView numberOfRowsInSection:0], (long)expectedRows);
}

//Test case to check row height.
- (void)testTableViewHeightForRowAtIndexPath
{
    CGFloat expectedHeight = 44.0; //change the expected row height and obseve the result.
    CGFloat actualHeight = landingView.landingTableView.rowHeight;
    XCTAssertEqual(expectedHeight, actualHeight, @"Cell should have %f height, but they have %f", expectedHeight, actualHeight);
}

//Test case to check the numeric value.
-(void)testNumbericValue{
    
    NSMutableArray *arrayForValidatingNumbericData = landingView.landingViewRankData;
    for (int i=0; i<arrayForValidatingNumbericData.count; i++) {
        
        id obj=[arrayForValidatingNumbericData objectAtIndex:i];
        
        if (![obj isKindOfClass:[NSString class]])
        {
            // It's an NSString, do something with it...
            XCTFail( @"Point array containing non numeric value");
        }
        
    }
}

//Test case to check the table title.
-(void)testTableTitle{
    NSString *tableTitle = @"ICC - 2014 Ranking"; //change and observe
    NSString *tableTitleFromView = landingView.headerName.text;;

     XCTAssertEqual(tableTitle, tableTitleFromView, @"Expected Table title %@ height, is not same as %@", tableTitle, tableTitleFromView);
}

@end
