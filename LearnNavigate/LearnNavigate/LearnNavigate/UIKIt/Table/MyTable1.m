//
//  MyTable1.m
//  LearnNavigate
//
//  Created by wanhongbin on 16/12/20.
//  Copyright © 2016年 wanhongbin. All rights reserved.
//

#import "MyTable1.h"
#import "myCell1.h"
#import "myCell2-code.h"

#define KMycell1 @"myCell1"
#define KMycell2 @"myCell2"

@interface MyTable1 ()

@end

@implementation MyTable1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//     self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;

    [self.tableView registerNib:[UINib nibWithNibName:@"myCell1" bundle:nil] forCellReuseIdentifier:KMycell1];
    [self.tableView registerClass:[myCell2_code class] forCellReuseIdentifier: KMycell2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 错误地方 1
//    static NSString *cellID = @"cellID";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
//    cell.textLabel.text = @"label1";
//    
//    return cell;
    
    // table1 cell
//    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
//    cell.textLabel.text = @"text1";
    
    // myCell1
//    static NSString *cellIdentifier = @"myCell1";
//    myCell1 *cell = [tableView dequeueReusableCellWithIdentifier:KMycell1];
//    
//    if(cell == nil) {
////        cell = [[[NSBundle mainBundle]loadNibNamed:@"myCell1" owner:nil options:nil] lastObject];
//        cell = [[myCell1 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:KMycell1];
//    }
    
    // myCell2
//    static NSString *cellIdentifier2 = @"myCell2";
    
    myCell2_code *cell = [tableView dequeueReusableCellWithIdentifier:KMycell2];
    
    if(cell == nil) {
        //        cell = [[[NSBundle mainBundle]loadNibNamed:@"myCell1" owner:nil options:nil] lastObject];
        cell = [[myCell2_code alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:KMycell2];
    }
    
    // cell2
    cell.label1.text = @"cell-label11-text";
    cell.label2.text = @"cell-label12-text";
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
