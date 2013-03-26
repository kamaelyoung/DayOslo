//
//  KMAboutViewController.m
//  KMWordPress
//
//  Created by Karl Monaghan on 25/09/2012.
//  Copyright (c) 2012 Crayons and Brown Paper. All rights reserved.
//

#import <Twitter/Twitter.h>
#import "Facebook.h"
#import "Appirater.h"

#import "KMAboutViewController.h"
#import "KMWebViewController.h"
#import "KMSettingsViewController.h"

#import "KMColors.h"

#define kAppId  @"621986632"

@interface KMAboutViewController ()

@end

@implementation KMAboutViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.navigationController.navigationBar setTintColor:[KMColors dayGrayColor]];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                          target:self
                                                                                          action:@selector(done)];
    
    self.navigationItem.title = @"Om";
    
    [[[GAI sharedInstance] defaultTracker] sendView:@"Om"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)done
{
    [[self parentViewController] dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 3;
            break;
        case 1:
            return 0;
            break;
        case 2:
            //break;
        case 3:
            return 1;
            break;
        default:
            break;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    // Configure the cell...
    switch (indexPath.section)
    {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                {
                    cell.textLabel.text = @"Vurder appen";
                    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                }
                    break;
                case 1:
                {
                    cell.textLabel.text = @"Del appen";
                    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                }
                    break;
                case 2:
                {
                    cell.textLabel.text = @"Kontakt oss";
                    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 1:
        {
            switch (indexPath.row) {
                case 0:
                {
                    cell.textLabel.text = @"More Apps";
                    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                }
                    break;
                case 1:
                {
                    cell.textLabel.text = @"About the Developer";
                    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                }
                    break;
                case 2:
                {
                    cell.textLabel.text = @"3rd Party Libraries";
                    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 2:
        {
            switch (indexPath.row) {
                case 0:
                {
                    cell.textLabel.text = @"Innstillinger";
                    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 3:
        {
            switch (indexPath.row) {
                case 0:
                {
                    cell.textLabel.text = @"Versjon";
                    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
                    
                    NSString *majorVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
                    NSString *minorVersion = [infoDictionary objectForKey:@"CFBundleVersion"];
                    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ (%@)", majorVersion, minorVersion];
                }
                    break;
                default:
                    break;
            }
        }
            break;
        default:
            break;
            
    }
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO animated:YES];
    
    switch (indexPath.section)
    {
        case 0:
        {
            switch (indexPath.row)
            {
                case 0:
                    [Appirater rateApp];
                    
                    [[[GAI sharedInstance] defaultTracker] sendEventWithCategory:@"uiAction"
                                                                      withAction:@"rateApp"
                                                                       withLabel:nil
                                                                       withValue:nil];
                    break;
                case 1:
                {
                    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"Del"
                                                                       delegate:self
                                                              cancelButtonTitle:@"Avbryt"
                                                         destructiveButtonTitle:nil
                                                              otherButtonTitles:@"Facebook", @"Twitter", @"Mail", nil];
                    [sheet showInView:self.view];
                    
                    [[[GAI sharedInstance] defaultTracker] sendEventWithCategory:@"uiAction"
                                                                      withAction:@"shareApp"
                                                                       withLabel:nil
                                                                       withValue:nil];
                    
                }
                    break;
                case 2:
                {
                    [self sendEmail];
                    
                    [[[GAI sharedInstance] defaultTracker] sendEventWithCategory:@"uiAction"
                                                                      withAction:@"sendFeedback"
                                                                       withLabel:nil
                                                                       withValue:nil];
                }
                default:
                    break;
            }
        }
            break;
        case 1:
        {
            switch (indexPath.row)
            {
                case 0:
                {
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewArtist?id=427412037"]];
                    
                    [[[GAI sharedInstance] defaultTracker] sendEventWithCategory:@"uiAction"
                                                                      withAction:@"seeOtherApps"
                                                                       withLabel:nil
                                                                       withValue:nil];
                }
                    break;
                case 1:
                {
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://karlmonaghan.com/about"]];
                    
                    [[[GAI sharedInstance] defaultTracker] sendEventWithCategory:@"uiAction"
                                                                      withAction:@"viewDeveloperAbout"
                                                                       withLabel:nil
                                                                       withValue:nil];
                }
                    break;
                case 2:
                {
                    KMWebViewController *libraries = [[KMWebViewController alloc] initWithWebURL:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"libraries" ofType:@"html"] isDirectory:NO]]];
                    
                    [self.navigationController pushViewController:libraries animated:YES];
                    
                    [[[GAI sharedInstance] defaultTracker] sendEventWithCategory:@"uiAction"
                                                                      withAction:@"viewLibraries"
                                                                       withLabel:nil
                                                                       withValue:nil];
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 2:
            switch (indexPath.row)
            {
                case 0:
                {
                    KMSettingsViewController *settings = [[KMSettingsViewController alloc] initWithNibName:@"KMSettingsViewController" bundle:nil];
                    
                    [self.navigationController pushViewController:settings animated:YES];
                }
                    break;
                    
                default:
                    break;
            }
        default:
            break;
    }
}

#pragma mark Facebook
- (void)postToFacebookFeed
{
    [[[GAI sharedInstance] defaultTracker] sendEventWithCategory:@"uiAction"
                                                      withAction:@"appFacebookShare"
                                                       withLabel:nil
                                                       withValue:nil];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"name":[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"], @"link":[NSString stringWithFormat:@"https://itunes.apple.com/ie/app/id%@?mt=8", kAppId], @"description" : @"News of the Bewildered"}];
    
    // Initiate a Facebook instance
    Facebook *facebook = [[Facebook alloc] initWithAppId:FBSession.activeSession.appID andDelegate:nil];
    
    // Set the session information for the Facebook instance
    facebook.accessToken = FBSession.activeSession.accessToken;
    facebook.expirationDate = FBSession.activeSession.expirationDate;
    
    // Invoke the dialog
    [facebook dialog:@"feed" andParams:params andDelegate:nil];
}

#pragma mark Twitter
- (void)postToTwitter
{
    [[[GAI sharedInstance] defaultTracker] sendEventWithCategory:@"uiAction"
                                                      withAction:@"appTwitterShare"
                                                       withLabel:nil
                                                       withValue:nil];
    
    if ([TWTweetComposeViewController canSendTweet])
    {
        TWTweetComposeViewController *tweetSheet = [[TWTweetComposeViewController alloc] init];
        
        [tweetSheet setInitialText:[NSString stringWithFormat:@"%@ finnes også på iPhone. Last ned da vel.", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"]]];
        
        [tweetSheet addURL: [NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/ie/app/id%@?mt=8", kAppId]]];
        
        [self.navigationController presentModalViewController:tweetSheet animated:YES];
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Ingen Twitter kontoer"
                                  message:@"Du må konfigurere minst 1 Twitter-konto under Innstillinger > Twitter før du kan dele via Twitter"
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
        [alertView show];
    }
}

#pragma mark Send Email
- (void)shareViaEmail
{
    [[[GAI sharedInstance] defaultTracker] sendEventWithCategory:@"uiAction"
                                                      withAction:@"appEmailShare"
                                                       withLabel:nil
                                                       withValue:nil];
    
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        
        mailer.mailComposeDelegate = self;
        
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        
        [mailer setSubject:[NSString stringWithFormat:@"Kanskje du vil like denne appen: %@", [infoDictionary objectForKey:@"CFBundleName"]]];
        
        NSString *body = [NSString stringWithFormat:@"Hei,<br /><br />Jeg tenkte kanskje du ville ha %@.  Du kan laste den ned fra <a href=\"%@\">iTunes App Store</a>.", [infoDictionary objectForKey:@"CFBundleName"], [NSString stringWithFormat:@"https://itunes.apple.com/ie/app/id%@?mt=8", kAppId]];
        [mailer setMessageBody:body isHTML:YES];

        [self.navigationController presentModalViewController:mailer animated:YES];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Mail ikke konfigurert"
                                                        message:@"Du kan ikke sende mail på denne enheten."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

- (void)sendEmail
{
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        
        mailer.mailComposeDelegate = self;
        
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        
        [mailer setSubject:[NSString stringWithFormat:@"Tilbakemelding for %@", [infoDictionary objectForKey:@"CFBundleName"]]];
        
        NSString *body = [NSString stringWithFormat:@"\n\n\nApp version: %@ (%@)\niOS Version: %@\niOS Device: %@", [infoDictionary objectForKey:@"CFBundleShortVersionString"], [infoDictionary objectForKey:@"CFBundleVersion"], [[UIDevice currentDevice] systemVersion], [[UIDevice currentDevice] model]];
        [mailer setMessageBody:body isHTML:NO];
        
        [mailer setToRecipients:@[@"daystoreoslo@gmail.com"]];
         
        [self.navigationController presentModalViewController:mailer animated:YES];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ingen mail kontoer"
                                                        message:@"Du kan ikke sende mail på denne enheten."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

#pragma mark MFMailComposeViewControllerDelegate
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            //DLog(@"Mail cancelled: you cancelled the operation and no email message was queued.");
            break;
        case MFMailComposeResultSaved:
            //DLog(@"Mail saved: you saved the email message in the drafts folder.");
            break;
        case MFMailComposeResultSent:
            //DLog(@"Mail send: the email message is queued in the outbox. It is ready to send.");
            break;
        case MFMailComposeResultFailed:
            //DLog(@"Mail failed: the email message was not saved or queued, possibly due to an error.");
            break;
        default:
            //DLog(@"Mail not sent.");
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma  mark UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 3)
    {
        return;
    }
    
    switch (buttonIndex) {
        case 0:
        {
            [self postToFacebookFeed];
        }
            break;
        case 1:
        {
            [self postToTwitter];
        }
            break;
        case 2:
        {
            [self shareViaEmail];
        }
            break;
        default:
            break;
    }
}
@end
