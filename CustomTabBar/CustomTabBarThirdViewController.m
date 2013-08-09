//
//  CustomTabBarThirdViewController.m
//  CustomTabBar
//
//  Created by Andrey Pushenko on 7/26/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "CustomTabBarThirdViewController.h"
#import "Annotation.h"

@implementation CustomTabBarThirdViewController

@synthesize map;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView
 {
 }
 */


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    map.showsUserLocation = YES;    
    [map setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
    
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:[NSArray arrayWithObjects:@"Map", @"Sattelite", @"Hibride", nil]];
    [segmentedControl addTarget:self action:@selector(changeMapType) forControlEvents:UIControlEventValueChanged];
    segmentedControl.frame = CGRectMake(0.0f, 0.0f, 200.0f, 30.0f);
    segmentedControl.selectedSegmentIndex = 0;
    segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    
    [self.view addSubview:segmentedControl];
    
    Annotation *annotation = [Annotation new];
    annotation.title = @"Annotation1";
    annotation.subtitle = @"Subtitle example";
    annotation.coordinate = CLLocationCoordinate2DMake(48.298674f, 35.395776f);
    [map addAnnotation:annotation];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    MKPinAnnotationView *annotationView = nil;
    
    if (annotation != mapView.userLocation) {
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:nil];
        if ([[annotation title] isEqualToString:@"Annotation1"]) {
            [annotationView setPinColor:MKPinAnnotationColorRed];
        } else {
            [annotationView setPinColor:MKPinAnnotationColorGreen];
            annotationView.animatesDrop = YES;
            annotationView.canShowCallout = YES;
        }
    }
    return annotationView;
}

- (void)changedMapType:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        map.mapType = MKMapTypeStandard;
    } else if (sender.selectedSegmentIndex == 1) {
        map.mapType = MKMapTypeSatellite;        
    } else if (sender.selectedSegmentIndex == 2) {
        map.mapType = MKMapTypeHybrid;
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.map = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
