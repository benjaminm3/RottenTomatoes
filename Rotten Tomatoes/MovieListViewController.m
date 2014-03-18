//
//  MovieListViewController.m
//  Rotten Tomatoes
//
//  Created by Benjamin Chang on 3/12/14.
//  Copyright (c) 2014 Benjamin Chang. All rights reserved.
//

#import "MovieListViewController.h"


@interface MovieListViewController ()
{
  Reachability *internetReachableFoo;
  BOOL internetConnection;
}
@property (weak, nonatomic) IBOutlet UITableView *movieListView;
@property(strong, nonatomic) NSArray *movieData;
@property (weak, nonatomic) IBOutlet UILabel *networkStatusLabel;
@property(strong, nonatomic) MBProgressHUD *hud;
@property(strong, nonatomic) UIRefreshControl *refreshControl;
@end

@implementation MovieListViewController
@synthesize movieData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if(self) {
      [self showLoading];
    
      if([MTReachabilityManager isReachable] == true) {
        self.networkStatusLabel.hidden = YES;
        self.movieListView.hidden = NO;
        self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
        if (self) {
        [self updateMovieData];
        }
      }
      else {
        self.networkStatusLabel.hidden = NO;
        self.movieListView.hidden = YES;
      }
      [self hideLoading];
    }
    return self;
}


- (void)showLoading
{
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.hud.labelText = @"Loading";
}

-(void)hideLoading
{
    [self.hud hide:YES];
}

-(void)refreshControlRequest
{
    [self performSelector:@selector(updateMovieData)withObject:nil];
}
-(void)updateMovieData
{
    NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=g9au4hv6khv6wzvzgt55gpqs";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSArray *object = [[NSJSONSerialization JSONObjectWithData:data options:0 error:nil] valueForKey:@"movies"];
        movieData = [Movie moviesWithArray:object];
        [self.movieListView reloadData];
    }];
    [self.refreshControl endRefreshing];

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    UINib *movieCellNib = [UINib nibWithNibName:@"MovieCell" bundle:nil];
    [self.movieListView registerNib:movieCellNib forCellReuseIdentifier:@"MovieCell"];
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull to Refresh"];
    
    [self.refreshControl addTarget:self action:@selector(refreshControlRequest) forControlEvents:UIControlEventValueChanged];
    [self.movieListView addSubview:self.refreshControl];
    self.navigationItem.title = @"Movies";
    self.movieListView.rowHeight = 132;
    self.movieListView.dataSource = self;
    self.movieListView.delegate = self;
    // Do any additional setup after loading the view from its nib.
}

- (void)refresh:(UIRefreshControl *)refreshControl {
    [refreshControl endRefreshing];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movieData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell" forIndexPath:indexPath];
    Movie *movie = self.movieData[indexPath.row];
    cell.movie = movie;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:
(NSIndexPath *)indexPath
{
    MovieDetailViewController *movieDetailViewController =
    [[MovieDetailViewController alloc] initWithNibName:
     NSStringFromClass([MovieDetailViewController class]) bundle:nil];
    // configure the subview here
    movieDetailViewController.movie = self.movieData[indexPath.row];
    [self.navigationController pushViewController:movieDetailViewController
                                         animated:YES];
}
@end
